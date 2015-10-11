REM Script to create multiple directory structure for Magento Modules
@echo off
SETLOCAL EnableDelayedExpansion
SETLOCAL EnableExtensions

SET "TAB=	"
SET moduleApp="Magento Module\app"
SET moduleSkin="Magento Module\skin"
SET moduleJs="Magento Module\js"
SET moduleLib="Magento Module\lib"

md %moduleApp%/code/local
md %moduleApp%/etc/modules
md %moduleApp%/design/adminhtml/default/default/layout
md %moduleApp%/design/frontend/base/default/layout

cd %moduleApp%/etc/modules/
(
echo ^<?xml version="1.0" encoding="UTF-8"?^>
echo ^<config^>
	echo %tab%^<modules^>
		echo %tab%%tab%^<Vivek_Multigrid^>
			echo %tab%%tab%%tab%^<active^>true^</active^>
			echo %tab%%tab%%tab%^<codePool^>local^</codePool^>
		echo %tab%%tab%^</Vivek_Multigrid^>
	echo %tab%^</modules^>
echo ^</config^>
) > "module.xml"

pause
