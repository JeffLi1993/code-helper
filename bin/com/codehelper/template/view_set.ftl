#set($layout = "WEB-INF/layout/nolayout.vm")
<link rel="stylesheet" href="../assets/css/datepicker.css" />
<link rel="stylesheet" href="../assets/css/dropzone.css" />
<link rel="stylesheet" href="../assets/css/ace.min.css" id="main-ace-style" />

<style> 
.modal-dialog{width:600px;} 
</style>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header no-padding">
			<div class="table-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<span class="white">&times;</span>
				</button>
				新增
			</div>
		</div>
		<div class="modal-body no-padding">
			<div class="tabbable">
    			<ul class="nav nav-tabs">
    				<li class="active">
    					<a data-toggle="tab" href="#basic">
							<i class="green ace-icon fa fa-home bigger-120"></i>
    						基本信息
    					</a>
    				</li>
    				<li class="">
    					<a data-toggle="tab" href="#image">
							<i class="orange ace-icon glyphicon glyphicon-picture bigger-120"></i>
    						图片
    					</a>
    				</li>
    			</ul>
    
    			<div class="tab-content">
    				<div id="basic" class="tab-pane fade active in">
    					<div class="row">
        					<div class="col-xs-12">
        						<form class="form-horizontal" id="form" method="post" action="set${className_Java}.htm">
        							<input type="hidden" name="id" value="$!{model.id}" />
        							<input type="hidden" name="_csrf_token" value="$tokenUtils.getToken()" />
							<#list tableCarrays as tableCarray>
					    		<#if tableCarray.carrayName!='id'>
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"><#if tableCarray.comment!="">${tableCarray.comment}</#if></label>
										<div class="col-sm-3">
											<input type="text" id="${tableCarray.carrayName}" name="${tableCarray.carrayName}" class="input-sm col-xs-12" value="$!{model.${tableCarray.carrayName}}" />
										</div>
									</div>
					    		</#if>
					    	</#list>
        						</form>
        					</div>
        				</div>
    				</div>
    
    				<div id="image" class="tab-pane fade">
    					<div class="row">
							<div class="col-xs-12">
								<div>
									<form action="toSetCompany.htm" class="dropzone" id="dropzone">
										<div class="fallback">
											<input name="file" type="file" multiple="" />
										</div>
									</form>
								</div>
							</div>
						</div>
    				</div>
    			</div>
    		</div>
		</div>
		<div class="modal-footer no-margin-top">
			<button class="btn btn-white btn-info btn-round" onclick="javascript:$('#form').submit();">
				<i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>
				保存
			</button>
			<button class="btn btn-white btn-default btn-round" data-dismiss="modal">
				<i class="ace-icon fa fa-times red2"></i>
				取消
			</button>
		</div>
	</div>
</div>
<script src="../assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="../assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
<!--textarea限制输入-->
<script src="../assets/js/chosen.jquery.min.js"></script>
<script src="../assets/js/jquery.autosize.min.js"></script>
<!--textarea限制输入-->
<!--textarea限制输入-->
<script src="../assets/js/jquery.maskedinput.min.js"></script>
<!--textarea限制输入-->	
<script src="../assets/js/dropzone.min.js"></script>

<script type="text/javascript">
	jQuery(function($) {
		$('textarea[class*=autosize]').autosize({append: "\n"});
		$('textarea.limited').inputlimiter({
			remText: '还可以输入%n个字',
			limitText: '最大可以输入 : %n.'
		});
	
		$('.input-mask-phone').mask('(9999) 99999999');
	});
	
	jQuery(function($){
    	Dropzone.autoDiscover = false;
    	try {
    	  var myDropzone = new Dropzone("#dropzone" , {
    	    paramName: "file", // The name that will be used to transfer the file
    	    maxFilesize: 1, // MB
    	
    		addRemoveLinks : true,
    		dictDefaultMessage :'<i class="ace-icon fa fa-caret-right red"></i> 拖拽文件到此区域或点击上传<br/><i class="upload-icon ace-icon fa fa-cloud-upload blue fa-3x"></i>',
    		dictResponseError: '文件上传失败!',
    		//change the previewTemplate to use Bootstrap progress bars
    		previewTemplate: '<div class="dz-preview dz-file-preview">\
								<div class="dz-details">\
									<div class="dz-filename">\
										<span data-dz-name></span>\
									</div>\
									<div class="dz-size" data-dz-size></div>\
										<img data-dz-thumbnail />\
								</div>\
								<div class="progress progress-small progress-striped active">\
									<div class="progress-bar progress-bar-success" data-dz-uploadprogress></div>\
								</div>\
								<div class="dz-success-mark">\
									<span></span>\
								</div>\
								<div class="dz-error-mark">\
									<span></span>\
								</div>\
								<div class="dz-error-message">\
									<span data-dz-errormessage></span>\
								</div>\
							</div>'
    	  });
    	} catch(e) {
    	  alert('Dropzone.js does not support older browsers!');
    	}
	});
</script>