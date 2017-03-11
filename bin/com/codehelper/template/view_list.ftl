<table class="table table-striped table-bordered table-hover">
	<input type="hidden" id="ids"/>
	<thead>
		<tr>
			<th class="center">
				<label class="position-relative">
					<input type="checkbox" class="ace" />
					<span class="lbl"></span>
				</label>
			</th>
		<#list tableCarrays as tableCarray>
    		<#if tableCarray.carrayName!='id'>
			<th><#if tableCarray.comment!="">${tableCarray.comment}</#if></th>
    		</#if>
    	</#list>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	#foreach($model in $!{pagin.resultList})  
		<tr>
			<td class="center">
				<label class="position-relative">
					<input type="checkbox" class="ace" title="$!model.id"/>
					<span class="lbl"></span>
				</label>
			</td>
	    <#list tableCarrays as tableCarray>
    		<#if tableCarray.carrayName!='id'>
			<td>$!model.${tableCarray.carrayName}</td>
    		</#if>
    	</#list>
			<td>
				<div class="hidden-sm hidden-xs action-buttons">
        			<a class="green" data-toggle="modal" data-target="#modal" href="toSet${className_Java}.htm?id=$!model.id">
        				<i class="ace-icon fa fa-pencil bigger-130"></i>
        			</a>
        			<a class="red delete" href="javascript:deleteModel('delete${className_Java}.htm?id=$!model.id')">
        				<i class="ace-icon fa fa-trash-o bigger-130"></i>
        			</a>
        		</div>
			</td> 
		</tr>
	#end
	</tbody>
</table>

#if(1 < $!pagin.totalPages)
 #set($toUrl="${className}List.htm?page=")
 #parse('WEB-INF/control/page.vm')  
#end

<script src="../assets/js/bootbox.min.js"></script>
<script type="text/javascript">
	jQuery(function($) {
		$(document).on('click', 'th input:checkbox' , function(){
			var that = this;
			var ids="";
			$(this).closest('table').find('tr > td:first-child input:checkbox')
			.each(function(){
				this.checked = that.checked;
				$(this).closest('tr').toggleClass('selected');
				
				if(this.checked){
					ids += $(this).attr("title") + ",";
				}
			});
			$('#ids').val(ids);
			
			handleButton();
		});
		
		$(document).on('click', 'td input:checkbox' , function(){
			if(this.checked){
				$('#ids').val($('#ids').val() + $(this).attr("title") + ",");
			}else{
				$('#ids').val($('#ids').val().replace($(this).attr("title") + ",",""));
			}
			
			handleButton();
		});
		
		$('#add').attr("href","toSet${className_Java}.htm");
	})
	
	//
	function handleButton(){
		var ids = $('#ids').val();
		if(""!=ids){
			var arr = ids.split(",");
			var id = arr[arr.length-2];
			$('#edit').attr("href","toSet${className_Java}.htm?id=" + id);
			$('#edit').attr("data-toggle","modal");
			$('#edit').attr("data-target","#modal");
			
			$("[data-toggle='modal']").click(function(){
                var target = $(this).attr('data-target');
                var url = $(this).attr('href');
                $(target).load(url);
            });
			
			$('#delete').attr("onclick","javascript:deleteModel('delete${className_Java}.htm?id=" + ids + "')");
		}else{
			$('#edit').removeAttr("href");
			$('#edit').removeAttr("data-toggle");
			$('#edit').removeAttr("data-target");
			$('#delete').removeAttr("onclick");
		}
	}
	
	function deleteModel(url){
		bootbox.confirm("删除将无法恢复，确认删除？", function(result) {
			if(result) {
				window.location.href=url;
			}
		});
	}
</script>