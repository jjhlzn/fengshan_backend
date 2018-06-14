<%@ Page Title="" Language="C#" MasterPageFile="~/admin/production/admin.Master"  AutoEventWireup="true" CodeBehind="neworder.aspx.cs" Inherits="fengshan.admin.production.neworder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="../vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="../vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="../vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">

    <link rel="stylesheet" href="../jQuery-File-Upload/css/style.css">
    <!-- blueimp Gallery styles -->
    <link rel="stylesheet" href="https://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" href="../jQuery-File-Upload/css/jquery.fileupload.css">
    <link rel="stylesheet" href="../jQuery-File-Upload/css/jquery.fileupload-ui.css">
    <!-- CSS adjustments for browsers with JavaScript disabled -->
    <noscript><link rel="stylesheet" href="../jQuery-File-Upload/css/jquery.fileupload-noscript.css"></noscript>
    <noscript><link rel="stylesheet" href="../jQuery-File-Upload/css/jquery.fileupload-ui-noscript.css"></noscript>

    <link href="./css/neworder.css" rel="stylesheet">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="right_col" role="main">
     <div class="">
        
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>新增订单 <small></small></h2>
              
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <div id="demo-form2" class="form-horizontal form-label-left">
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">订单名称
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="orderName" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">金额
                        </label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <input type="text" id="amount" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">淘宝ID
                        </label>
                       <div class="col-md-2 col-sm-2 col-xs-4">
                          <input type="text" id="taobaoId" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">接单人
                        </label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select id="receiveOrderPerson" class="select2_single form-control" tabindex="-1">
                            <option>选择接单人</option>
                            <option value="张三">张三</option>
                            <option value="李四">李四</option>
                          </select>
                        </div>
                      </div>

                     

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">接单时间</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <input id="orderDate" class="form-control col-md-3 col-xs-12" type="text" name="middle-name" 
                              onclick="WdatePicker({minDate:'2017-01-01',maxDate:'2020-12-31'})">
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">发货时间</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <input id="deliveryDate" class="form-control col-md-3 col-xs-12" type="text" name="middle-name" 
                              onclick="WdatePicker({minDate:'2017-01-01',maxDate:'2020-12-31'})">
                        </div>
                      </div>


                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">材质</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="material" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                        </div>
                      </div>


                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">款式</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="style">
                            <option>选择款式</option>
                            <option value="规则">规则</option>
                            <option value="不规则">不规则</option>
                          </select>
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">尺寸</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="size" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">雕刻方式</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="carveStyle">
                            <option>选择雕刻方式</option>
                            <option value="圆弧阴雕">圆弧阴雕</option>
                            <option value="普通雕刻">普通雕刻</option>
                          </select>
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">颜色</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="color" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">物流方式</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="deliveryCompany">
                            <option>选择物流</option>
                            <option value="顺丰">顺丰</option>
                            <option value="德邦">德邦</option>
                          </select>
                        </div>
                         <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="deliveryPayType">
                            <option>选择支付方式</option>
                            <option value="到付">到付</option>
                            <option value="预付">预付</option>
                          </select>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="deliveryStyle">
                            <option>选择打包方式</option>
                            <option value="打木架">打木架</option>
                            <option value="不打木架">不打木架</option>
                          </select>
                        </div>
                      </div>

                     <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">收货人地址</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <textarea id="address" class="form-control" rows="3" placeholder='输入地址'></textarea>
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <textarea id="meno" class="form-control" rows="3" placeholder='输入备注'></textarea>
                        </div>
                     </div>

                     <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">内容+颜色样板图片</label>
                         <div class="col-md-8 col-sm-8 col-xs-16">
                            <form id="fileupload" action="https://jquery-file-upload.appspot.com/" method="POST" enctype="multipart/form-data">

                                <!-- Redirect browsers with JavaScript disabled to the origin page -->
                                <noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript>
                                <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                                <div class="row fileupload-buttonbar">
                                    <div class="col-lg-7">
                                        <!-- The fileinput-button span is used to style the file input field as button -->
                                        <span class="btn btn-success fileinput-button">
                                            <i class="glyphicon glyphicon-plus"></i>
                                            <span>添加图片</span>
                                            <input type="file" name="files[]" multiple>
                                        </span>
                                        <button type="submit" class="btn btn-primary start">
                                            <i class="glyphicon glyphicon-upload"></i>
                                            <span>开始上传</span>
                                        </button>
                                        <!-- The global file processing state -->
                                        <span class="fileupload-process"></span>
                                    </div>
                                    <!-- The global progress state -->
                                    <div class="col-lg-5 fileupload-progress fade">
                                        <!-- The global progress bar -->
                                        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                            <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                                        </div>
                                        <!-- The extended global progress state -->
                                        <div class="progress-extended">&nbsp;</div>
                                    </div>
                                </div>
                                <!-- The table listing the files available for upload/download -->
                                <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
                            </form>
                          </div>
                     </div>

                    
                      
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-success" onclick="submitForm()">提交</button>
                        </div>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
            </div>

        


      
          </div>
         </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="JSPlaceHolder" runat="server">

        <!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>Delete</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>

            <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-wysiwyg -->
    <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="../vendors/google-code-prettify/src/prettify.js"></script>
    <!-- jQuery Tags Input -->
    <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
    <!-- Switchery -->
    <script src="../vendors/switchery/dist/switchery.min.js"></script>
    <!-- Select2 -->
    <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- Parsley -->
    <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Autosize -->
    <script src="../vendors/autosize/dist/autosize.min.js"></script>
    <!-- jQuery autocomplete -->
    <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
    <!-- starrr -->
    <script src="../vendors/starrr/dist/starrr.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    <script src="../My97DatePicker/WdatePicker.js"></script>
     <script src="./js/lodash.js"></script>


    <script src="../jQuery-File-Upload/js/vendor/jquery.ui.widget.js"></script>
    <script src="https://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
    <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
    <script src="https://blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
    <!-- The Canvas to Blob plugin is included for image resizing functionality -->
    <script src="https://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
    <!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
    <!-- blueimp Gallery script -->
    <script src="https://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
    <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
    <script src="../jQuery-File-Upload/js/jquery.iframe-transport.js"></script>
    <!-- The basic File Upload plugin -->
    <script src="../jQuery-File-Upload/js/jquery.fileupload.js"></script>
    <!-- The File Upload processing plugin -->
    <script src="../jQuery-File-Upload/js/jquery.fileupload-process.js"></script>
    <!-- The File Upload image preview & resize plugin -->
    <script src="../jQuery-File-Upload/js/jquery.fileupload-image.js"></script>
    <!-- The File Upload audio preview plugin -->
    <script src="../jQuery-File-Upload/js/jquery.fileupload-audio.js"></script>
    <!-- The File Upload video preview plugin -->
    <script src="../jQuery-File-Upload/js/jquery.fileupload-video.js"></script>
    <!-- The File Upload validation plugin -->
    <script src="../jQuery-File-Upload/js/jquery.fileupload-validate.js"></script>
    <!-- The File Upload user interface plugin -->
    <script src="../jQuery-File-Upload/js/jquery.fileupload-ui.js"></script>
    <!-- The main application script -->
    <script src="../jQuery-File-Upload/js/main.js"></script>

     <script src="./js/neworder.js"></script>
</asp:Content>

