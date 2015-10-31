#!/bin/bash
CURR_DIR=$(pwd)
echo $CURR_DIR;
echo "Type the name of Package and then press [ENTER]:"
read Package
echo "Type the name of Module and then press [ENTER]:"
read Module
mkdir -p mage_module/"$Package"/"$Module"/{app,js,skin}/{etc,code,design,locale}/modules
cd mage_module/"$Package"/"$Module"/app/etc/modules

moduleFullName=${Package}_${Module};

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<config>
	<modules>
		<$moduleFullName>
			<active>true</active>
			<codePool>local</codePool>
		</$moduleFullName>
	</modules>
</config>" >> "$moduleFullName.xml";

exit;
