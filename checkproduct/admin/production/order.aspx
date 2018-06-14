<%@ Page Title="" Language="C#" MasterPageFile="~/admin/production/admin.Master"  AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="fengshan.admin.production.order" %>

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
  

    <link href="./css/order.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
       <div class="">
        
            <div class="clearfix"></div>
            <div class="row ">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>订单信息 <small></small></h2>
              
                    <div class="clearfix"></div>
                  </div>

                  <div class="x_content ordercontent " >
                    <br />

                    <table style="width: 70%; margin: auto">
                        <tr>
                            <td style="width: 10%; text-align: center">淘宝ID：</td>
                            <td> 1234567</td>
                            <td style="width: 10% ;  text-align: center">接单人：</td>
                            <td> 小刘</td>
                        </tr>
                        <tr>
                            <td style="width: 10%; text-align: center">接单时间：</td>
                            <td> 2018-03-01</td>
                            <td style="width: 10% ;  text-align: center">发货时间：</td>
                            <td> 2018-03-01</td>
                        </tr>
                        <tr>
                            <td style="width: 10%; text-align: center">材质：</td>
                            <td> 木头</td>
                            <td style="width: 10% ;  text-align: center">款式：</td>
                            <td> 规则</td>
                        </tr>
                        <tr>
                            <td style="width: 10%; text-align: center">尺寸：</td>
                            <td> 10*20cm</td>
                            <td style="width: 10% ;  text-align: center">雕刻方式：</td>
                            <td> 圆弧阴雕 </td>
                        </tr>
                        <tr>
                            <td style="width: 10%; text-align: center">颜色：</td>
                            <td colspan="3"> 红色</td>
    
                        </tr>
                        
                        <tr>
                            <td style="width: 10%; text-align: center">物流方式：</td>
                            <td colspan="3"> 顺丰 -  到付  - 打木架</td>
    
                        </tr>
                        <tr>
                            <td style="width: 10%; text-align: center">收货人：</td>
                            <td colspan="3"> 浙江省东阳市横店镇万盛南街58号 1370674299 金军航</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="imagerow"> 
                                <div style="width: 100%; height: 100%;">
                                    内容：
                                    <img width="98%"
                                        src="http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png"/>
                                    <img width="98%"
                                        src="http://pic.58pic.com/58pic/13/66/58/20258PICpDh_1024.png"/>
                                </div>
                            </td>
                            <td colspan="2"  class="imagerow"> 
                                <div style="width: 100%; height: 100%;">
                                    颜色样板：
                                    <img width="98%"
                                        src="http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png"/>
                                    <img width="98%"
                                        src="http://pic.58pic.com/58pic/13/66/58/20258PICpDh_1024.png"/>
                                </div>
                            </td>
                        </tr>
                    </table>

                  </div>
                </div>
              </div>
            </div>

        


      
          </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="JSPlaceHolder" runat="server">
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
</asp:Content>



