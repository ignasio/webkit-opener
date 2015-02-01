#$headless = Headless.new
#$headless.start
$chrome = Watir::Browser.new :chrome
$firefox = Watir::Browser.new :firefox

$br_arr = [$chrome,$firefox]
$br_arr_keyword = ["chrome","firefox"]

