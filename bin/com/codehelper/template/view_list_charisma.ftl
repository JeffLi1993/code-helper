<div id="content" class="span10">
<a href="toSet${className_Java}.htm?id=0"class="btn btn-small btn-primary">我要提交</a>

<div class="row-fluid sortable">	
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2>Combined All</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
				<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
				<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
			</div>
		</div>
		<div class="box-content">
			<table class="table table-bordered table-striped table-condensed">
				  <thead>
					  <tr>
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
					    <#list tableCarrays as tableCarray>
				    		<#if tableCarray.carrayName!='id'>
							<td>$!model.${tableCarray.carrayName}</td>
				    		</#if>
				    	</#list>
							<td class="center">
								<a href="toSet${className_Java}.htm?id=$!model.id" class="icon-edit"></a>
								<a href="delete${className_Java}.htm?id=$!model.id" class="icon-remove"></a>
							</td>  
						</tr>
					#end                                       
				  </tbody>
			 </table>  
			 <div class="pagination pagination-centered">
			  <ul>
				<li><a href="#">&lt;</a></li>
				<li class="active">
				  <a href="#">1</a>
				</li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">&gt;</a></li>
			  </ul>
			</div>     
		</div>
	</div>
</div>