REM Rename recursively from directory path given below so put this script in that same directory
REM for /r "<full_directory_path>" %%x in (<current_name>) do ren "%%x" <rename_to>
REM for /r "D:\Magento Modules\MultipleGrids_11-10-2015\MultipleGrids\" %%x in (*.php5) do ren "%%x" *.php
REM for /r "D:\Magento Modules\MultipleGrids_11-10-2015\MultipleGrids\" %%x in (Developer.*) do ren "%%x" Developers.*
for /D /r "D:\Magento Modules\MultipleGrids_11-10-2015\MultipleGrids\" %%x in (Developer) do ren "%%x" Developers
