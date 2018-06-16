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

                     <div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-5">
                        <button class="btn btn-success " onclick="alert('未实现');return false;">打印</button>
                        <button class="btn btn-danger " onclick="alert('未实现');return false;">删除</button>
                    </div>


                    <table style="width: 72%; margin: auto">
                        <tr>
                            <td style="width: 11%; text-align: center">淘宝ID：</td>
                            <td id="taobaoId"> </td>
                            <td style="width: 11% ;  text-align: center">接单人：</td>
                            <td id="receiveOrderPerson"> </td>
                        </tr>

                        <tr>
                            <td style="width: 11%; text-align: center">订单名称：</td>
                            <td id="orderName"> </td>
                            <td style="width: 11% ;  text-align: center">金额：</td>
                            <td id="amount"> </td>
                        </tr>

                        <tr>
                            <td style="width: 11%; text-align: center">接单时间：</td>
                            <td id="orderDate"> </td>
                            <td style="width: 11% ;  text-align: center">发货时间：</td>
                            <td id="deliveryDate"></td>
                        </tr>

                        <tr>
                            <td style="width: 11%; text-align: center">款式：</td>
                            <td id="style"> </td>
                            <td style="width: 11% ;  text-align: center">雕刻方式：</td>
                            <td id="carveStyle"></td>
                        </tr>

                        <tr>
                            <td style="width: 11%; text-align: center">材质：</td>
                            <td id="material" colspan="3" > </td>
                        </tr>

                        <tr>
                            <td style="width: 11%; text-align: center">尺寸：</td>
                            <td id="size" colspan="3" ></td>
                        </tr>
                        <tr>
                            <td style="width: 11%; text-align: center">颜色：</td>
                            <td colspan="3" id="color"> </td>
    
                        </tr>
                        
                        <tr>
                            <td style="width: 11%; text-align: center">物流方式：</td>
                            <td colspan="3" id="delivery"> </td>
    
                        </tr>
                        <tr>
                            <td style="width: 11%; text-align: center">收货人：</td>
                            <td colspan="3" id="address"> </td>
                        </tr>
                        <tr >
                            <td style="width: 11%; text-align: center">进度：</td>
                            <td  colspan="3" style="width: 89%;" id="progress">

                               <table class="progressTable">
                                   <tr id="progressRow">
                                       
                                   </tr>
                               </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="imagerow"> 
                                <div style="width: 100%; height: 100%;">
                                    &nbsp; &nbsp; &nbsp;内容：
                                    <div style="width: 100%; height: 100%;" id="contentImagesDiv">
                                        </div>
                                    
                                   
                                </div>
                            </td>
                            <td colspan="2"  class="imagerow"> 
                                <div style="width: 100%; height: 100%;">
                                      &nbsp; &nbsp; &nbsp;颜色样板：
                                    <div style="width: 100%; height: 100%;" id="templateImagesDiv">
                                        </div>
                                   
                                 
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
     <script src="./js/order.js"></script>
</asp:Content>



