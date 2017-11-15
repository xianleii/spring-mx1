<script src="${path}/assets/js/jquery-2.0.3.min.js"></script>
<script src="${path}/assets/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='${path}/assets/js/jquery-2.0.3.min.js'>" + "<" + "script>");
</script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='${path}/assets/js/jquery-1.10.2.min.js'>" + "<" + "script>");
</script>
<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='${path}/assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
</script>
<script src="${path}/assets/js/ace-extra.min.js"></script>
<script src="${path}/assets/js/html5shiv.js"></script>
<script src="${path}/assets/js/respond.min.js"></script>
<script src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path}/assets/js/typeahead-bs2.min.js"></script>
<script src="${path}/assets/js/excanvas.min.js"></script>
<script src="${path}/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="${path}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${path}/assets/js/jquery.slimscroll.min.js"></script>
<script src="${path}/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="${path}/assets/js/jquery.sparkline.min.js"></script>
<script src="${path}/assets/js/flot/jquery.flot.min.js"></script>
<script src="${path}/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="${path}/assets/js/flot/jquery.flot.resize.min.js"></script>
<script src="${path}/assets/js/ace-elements.min.js"></script>
<script src="${path}/assets/js/ace.min.js"></script>
<script src="${path}/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${path}/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="${path}/assets/js/jqGrid/i18n/grid.locale-en.js"></script>
<script src="${path}/assets/js/sys/sys.js" ></script>
<script src="${path}/assets/js/WdatePicker.js"></script>
<script src="${path}/assets/js/chosen.jquery.min.js"></script>
<script src="${path}/assets/js/select2.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/layer/layer.js"></script>
<script type="text/javascript" src="${path}/assets/js/layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="${path}/assets/js/layer/mylayer.js"></script>
<script type="text/javascript" src="${path}/assets/js/validator/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="${path}/assets/js/validator/js/bootstrapValidator_zh_CN.js"></script>
<script type="text/javascript" src="${path}/assets/js/validator/js/myBootstrapValidator.js"></script>
<script src="${path}/assets/js/jquery.serializejson.min.js"></script>

<script>
    function updateActionIcons(table) {
        var replacement =
        {
            'ui-icon-pencil': 'icon-pencil blue',
            'ui-icon-trash': 'icon-trash red',
            'ui-icon-disk': 'icon-ok green',
            'ui-icon-cancel': 'icon-remove red'
        };
        $(table).find('.ui-pg-div span.ui-icon').each(function () {
            var icon = $(this);
            var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
            if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
        })
    }

    function updatePagerIcons(table) {
        var replacement =
        {
            'ui-icon-seek-first': 'icon-double-angle-left bigger-140',
            'ui-icon-seek-prev': 'icon-angle-left bigger-140',
            'ui-icon-seek-next': 'icon-angle-right bigger-140',
            'ui-icon-seek-end': 'icon-double-angle-right bigger-140'
        };
        $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
            var icon = $(this);
            var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

            if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
        })
    }

    function enableTooltips(table) {
        $('.navtable .ui-pg-button').tooltip({container: 'body'});
        $(table).find('.ui-pg-div').tooltip({container: 'body'});
    }
    
    function DatePicker(beginSelector){
    	$(beginSelector).datepicker({
                language:'cn',
                autoclose: true,
                startView: 0,
                format: 'yyyy-mm-dd',
                clearBtn:true,
                todayBtn:true,
                endDate:new Date()
            }).on('changeDate', function(ev){
            if(ev.date){
                $(endSelector).datepicker('setStartDate', new Date(ev.date.valueOf()))
            }else{
                $(endSelector).datepicker('setStartDate',null);
            }
        })
	}
    
    function DatePickerNotRule(beginSelector,endSelector){
        $(beginSelector).datepicker({
                language:'cn',
                autoclose: true,
                startView: 0,
                format: 'yyyy-mm-dd',
                clearBtn:true,
                todayBtn:true,
                linked:true,
                endDate: $(endSelector).val()
            }).on('changeDate', function(ev){
            if(ev.date){
                $(endSelector).datepicker('setStartDate', new Date(ev.date.valueOf()))
            }else{
                $(endSelector).datepicker('setStartDate',null);
            }
        })
        $(endSelector).datepicker({
                language:'cn',
                autoclose: true,
                startView: 0,
                format: 'yyyy-mm-dd',
                clearBtn:true,
                todayBtn:true,
                linked:true,
                startDate: $(beginSelector).val()
            }).on('changeDate', function(ev){
            if(ev.date){
                $(beginSelector).datepicker('setEndDate', new Date(ev.date.valueOf()))
            }else{
                $(beginSelector).datepicker('setEndDate',new Date());
            }
        })
    }

    var goBack = function() {
		/* $.get("${webRoot}/get/referer.do", function(res) {
			console.log(res);
			if (res == "") {
				history.back();
			} else {
				location.href = res;
			}
		}); */
    	location.href = "${webRoot}/base/product/list.do";
	}
    

    function stringTrim(_this){
    	_this.value = _this.value.trim()
    	//var value=$(_this)[0].value.trim();
    	//$(_this)[0].value=value;
    }
</script>

