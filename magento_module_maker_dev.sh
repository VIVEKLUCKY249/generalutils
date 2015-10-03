#!/bin/bash
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
cd $SCRIPT_DIR;

echo "Enter the package name:"
# Get the name, and format it into the formats we need.
read packageName;
packageName=${packageName//[[:blank:]]/};

echo "Enter the module name:"
# Get the name, and format it into the formats we need.
read moduleName;
moduleName=${moduleName//[[:blank:]]/};

# Make package dir.
echo "Adding package $packageName...";
PACKAGE_DIR="$SCRIPT_DIR/$packageName";
mkdir -m 777 $PACKAGE_DIR;

# Make module dir.
echo "Adding module $moduleName...";
MODULE_DIR="$PACKAGE_DIR/$moduleName";
# test -d $MODULE_DIR &&  || echo Does not exist
mkdir -p -- $MODULE_DIR || exit "Directory already exists";

# Make etc dir.
echo "Adding \"etc\" directory...";
mkdir -p -- "$MODULE_DIR/etc";

# Make Block dir.
echo "Adding \"Block\" directory...";
mkdir -p -- "$MODULE_DIR/Block";

# Make Helper dir.
echo "Adding \"Helper\" directory...";
mkdir -p -- "$MODULE_DIR/Helper";

# Make Model dir.
echo "Adding \"Model\" directory...";
mkdir -p -- "$MODULE_DIR/Model";

# Make controllers dir.
echo "Adding \"controllers\" directory...";
mkdir -p -- "$MODULE_DIR/controllers";

# Make "Adminhtml" dir in "controllers"
echo "Adding \"controllers/Adminhtml\" directory...";
mkdir -p -- "$MODULE_DIR/controllers/Adminhtml";

# Write necessary code to files
cd "$MODULE_DIR/etc";
cat > "config.xml" << EOF
<?xml version="1.0"?>
<config>
    <modules>
        <${packageName}_${moduleName}>
            <version>1.0.0</version>
        </${packageName}_${moduleName}>
    </modules>
    <global>
    </global>
    <default>
    </default>
</config>
EOF

cd "$MODULE_DIR/controllers";
cat > "IndexController.php" << EOF
<?php
class ${packageName}_${moduleName}_IndexController extends Mage_Core_Controller_Front_Action {
	public function indexAction() {
		\$this->loadLayout();
		
		// Your controller stuff
		
    \$this->renderLayout();
	}
}
EOF

cd "$MODULE_DIR/controllers/Adminhtml";
cat > "CustomController.php" << EOF
<?php
class ${packageName}_${moduleName}_Adminhtml_CustomController extends Mage_Core_Controller_Front_Action {
	public function indexAction() {
		\$this->loadLayout()
				->_setActiveMenu('${moduleName}')
				->_title($this->__('Index Action'));

		// Your controller stuff
		
    \$this->renderLayout();
	}
}
EOF

cd "$MODULE_DIR/Model";
cat > "${moduleName}.php" << EOF
<?php
class ${packageName}_${moduleName}_Model_${moduleName} extends Mage_Core_Model_Abstract
{
	public function _construct()
	{
		parent::_construct();
		\$this->_init('${moduleName}/${moduleName}');
	}
}
EOF

cd "$MODULE_DIR/Helper";
cat > "Data.php" << EOF
<?php
class ${packageName}_${moduleName}_Helper_Data extends Mage_Core_Helper_Abstract {}
EOF

cd "$MODULE_DIR/Block";
cat > "${moduleName}.php" << EOF
<?php
class ${packageName}_${moduleName}_Block_${moduleName} extends Mage_Core_Helper_Abstract {
	public function _prepareLayout()
	{
		return parent::_prepareLayout();
	}
	
	public function get${moduleName}()
	{ 
		if (!\$this->hasData('${moduleName}')) {
			\$this->setData('${moduleName}', Mage::registry('${moduleName}'));
		}
		return \$this->getData('${moduleName}');
	}
}
EOF
