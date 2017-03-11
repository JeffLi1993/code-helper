<div id="content" class="span10">
	<div class="row-fluid sortable">
		<div class="box span12">
			<div class="box-header well" data-original-title>
				<h2><i class="icon-edit"></i> Form Elements</h2>
				<div class="box-icon">
					<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
					<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
					<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
				</div>
			</div>
			<div class="box-content">
				<form id="form" name="form" class="form-horizontal" method="post" action="set${className_Java}.htm">
					<input type="hidden" name="id" value="$!{model.id}" />
					<input type="hidden" name="_csrf_token" value="$tokenUtils.getToken()" />
				  <fieldset>
					<#list tableCarrays as tableCarray>
			    		<#if tableCarray.carrayName!='id'>
			    			<div class="control-group">
							  <label class="control-label" for="typeahead"><#if tableCarray.comment!="">${tableCarray.comment}</#if></label>
							  <div class="controls">
								<input type="text" id="${tableCarray.carrayName}" name="${tableCarray.carrayName}" value="$!{model.${tableCarray.carrayName}}" minlength="2" class="form-text required"/>
							  </div>
							</div>
			    		</#if>
			    	</#list>
					<div class="form-actions">
					  <button type="submit" class="btn btn-primary">提交</button>
					  <button type="reset" class="btn" onclick="location.href='$!appType/${className}List.htm'">返回</button>
					</div>
				  </fieldset>
				</form>   
				</div>
			</div>
		</div>
</div>