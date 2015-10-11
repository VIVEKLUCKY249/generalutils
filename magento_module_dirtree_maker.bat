REM Script to create multiple directory structure for Magento Modules
@echo off
setlocal EnableDelayedExpansion

SET moduleApp="Magento Module\app"
SET moduleSkin="Magento Module\skin"
SET moduleJs="Magento Module\js"
SET moduleLib="Magento Module\lib"

md %moduleApp%/code/local
md %moduleApp%/etc/modules
md %moduleApp%/design/adminhtml/default/default/layout
md %moduleApp%/design/frontend/base/default/layout
