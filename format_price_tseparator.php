<?php
## Format price by providing thousand separator
public function vivekFormatPrice($price, $tSeparator = false)
{
		$formattedPrice = preg_replace('/\..*$(*SKIP)(*F)|(?<=\d)(?=(?:\d{3})+(?!\d))/', $tSeparator, $price);
		return $formattedPrice;
}

protected function _vivekFormatPrice($price, $tSeparator = false) {
		$accno = $price;
		$currency = substr($accno, -2);
		$accno = explode(',-', $accno);
		$accno[0] = number_format($accno[0], strlen(end(explode(".", $accno[0]))), '.', $tSeparator);
		$finalNumber = $accno[0].$currency;
		return $finalNumber;
}
