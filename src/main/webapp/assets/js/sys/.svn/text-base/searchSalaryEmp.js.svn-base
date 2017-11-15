
/**
 *选择薪资系统用户 (建议通过SYS.searchSalaryEmp(id)调用)
 *说明：使用了 jquery chosen.jquery.js插件
 **/
function searchSalaryEmp(id){
	var o =new Object(); 
	o.chosenId = id;
	o.searchValueHistory = null;//上一次查询值记录 （用于每次查询对比， 一样则不查询）
	o.init = function(ssThis){
		$("#"+o.chosenId).chosen({allow_single_deselect:true,no_results_text : "未找到此选项!"}); 
		$("#"+o.chosenId).chosen().change(function(){
			//alert($("#"+o.chosenId).val());
		});
		
		$("#"+ o.chosenId.replace(/[-]/g,"_") +"_chosen").find(".chosen-search").keyup(function(){
			var searchValue = $(this).find("input").val();
			if(o.searchValueHistory!=searchValue && searchValue!=""){
				o.searchValueHistory = searchValue;
				o.chosenUpdate(searchValue);
				$(this).find("input").val(searchValue);
			}
		});
	};
	
	o.getSalaryEmpDate = function(searchValue){
		var empJson = null;
		//SYS.ajax({//不使用SYSY.ajax 避免遮罩层
		$.ajax({
			url: ctx + "/salaryEmp/salaryEmpJSONList.do",
			async: false,
			type: "POST",
			data: "empLikeValue="+searchValue,
			dataType: "json",
			success :function(json){
				empJson =  json;
			}
		});
		return empJson;
		//return [{empName:'name-1',empNo:'1'},{empName:'name-2',empNo:'2'},{empName:'name-3',empNo:'3'},{empName:'name-4',empNo:'4'}];
	};
	
	o.chosenUpdate = function(searchValue){
		$("#"+ o.chosenId.replace(/[-]/g,"_") +"_chosen").find(".no-results").hide();
		var data = this.getSalaryEmpDate(searchValue);
		if(data!=null && data.length!=0){
			$("#"+o.chosenId+" > option[value!='']").remove();
			for ( var i in data) {
				//console.log(data[i].empName);
				$("#"+o.chosenId).append("<option value='"+data[i].empName+'-'+data[i].empNo+"'>"+data[i].empName+'-'+data[i].empNo+"</option>");
			}
			$("#"+o.chosenId).trigger("chosen:updated"); //当我们须要动态更新下的选择项时,只要在更新选择项后触发Chosen中的chosen:updated事务就可以了
		}
		$("#"+ o.chosenId.replace(/[-]/g,"_") +"_chosen").find(".no-results").show();
	}; 
	o.init();
}

//初始化启用													
//new searchSalaryEmp("chosenId");
