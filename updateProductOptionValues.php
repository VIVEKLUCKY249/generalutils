<?php
$magePath = 'app/Mage.php';
require_once $magePath;
Varien_Profiler::enable();
Mage::setIsDeveloperMode(true);
ini_set('display_errors', 1);
umask(0);
Mage::app()->setCurrentStore(Mage_Core_Model_App::ADMIN_STORE_ID);
$product_ids  = array(897);
$productmodel = Mage::getModel('catalog/product');
foreach ($product_ids as $product_id) {
	/**i use this two arrays for collecte value because i uses inside setData of 
	current option*/
	$cos     = array();
	$co      = array();
	$product = $productmodel->load($product_id);
	$options = $product->getProductOptionsCollection();
	if (isset($options)) {
		foreach ($options as $o) {
			$title = $o->getTitle();
			$optionType = $o->getType();
			//test type
			if ($optionType == "drop_down" && $title == "New Custom Title") {
				//getting collection of value related to current option
				$values = $o->getValuesCollection();
				$found  = false;
				foreach ($values as $k => $v) {
					//test existing of value for update
					echo "<pre/>";print_r(get_class($v));
					if (1 == preg_match("/Ja$/i", $v->getTitle())) {
						//update and save
						$v->setTitle("Ja")->setSku("kk45")->setPriceType("fixed")->setSortOrder(2)->setPrice(floatval(120.0000));
						$v->setOption($o)->save();
						/**
						this ligne is important i collecte all value required for normalize save function 
						related to current option
						*/
						$cos[] = $v->toArray($co);
					}
				}
			}
			$o->setData("values", $cos)->save();
			//var_dump($cos);
		}
	}
}

## OR ##

## $product = Mage::getModel('catalog/product')->load($product_id);
$product = Mage::getModel('catalog/product')->load(897);
$values = array();
foreach ($product->getOptions() as $o) {
	if($o->getTitle() == "New Custom Title") {
		$p = $o->getValues();
		foreach($p as $v) {
			if($v->getTitle() == "Ja") {
				$values[$v->getId()]['option_type_id'] = $v->getId();
				$values[$v->getId()]['title'] = 'Ja';
				$values[$v->getId()]['price'] = floatval(120);
				$values[$v->getId()]['price_type']= 'fixed';
				$values[$v->getId()]['sku'] = 'custom_sku123';
				$v->setValues($values);
				$v->saveValues();
			}
		}
	}
}
## $product->save();
