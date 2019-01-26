<%@ Page Title="" Language="C#" MasterPageFile="~/admin/production/admin.Master"  AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="fengshan.admin.production.order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <!-- <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet"> -->
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
     <link href="./css/print.min.css" rel="stylesheet">

    <link href="./css/order.css" rel="stylesheet">
    <style media="print">
        .hidden-div{
            display:block;
         }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
       <div class="">
        
            <div class="clearfix"></div>
            <div class="row ">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>订单信息 <small></small></h2>
                    <div class="nav navbar-right panel_toolbox">
                            <button class="btn btn-success " onclick="printClick();return false;">打印</button>
                            <button class="btn btn-primary "  onclick="modifyClick();return false;">修改</button>
                            <button class="btn btn-danger " onclick="deleteOrderClick(); return false;">删除</button>
                    </div>
                    <div class="clearfix"></div>
                  </div>
                   <div class="row" style="margin: auto;">

                            
                
                   </div>
                  <div class="x_content ordercontent " >
                    
                    <table style="width: 80%; margin: auto"  class="progressTable">
                        <tr>
                            <td>
                                  <table class="progressTable" style="margin-left: -25px;" >
                                           <tr id="progressRow">
                                      
                                           </tr>
                                  </table>
                            </td>
                            <td style="margin: auto; text-align: right;">
                                <img style="width: 60px; height: 60px;"
                   src="data:image/png;base64,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" />
                            </td>
                        </tr>

                    </table>
                    <table style="width: 80%; margin: auto" id="orderTable">
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
                        <tr>
                            <td style="width: 11%; text-align: center">备注：</td>
                            <td colspan="3" id="memo" style="color: red;"> </td>
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
                        <tr>
                            <td colspan="4" class="imagerow"> 
                                <div style="width: 100%; height: 100%;">
                                    &nbsp; &nbsp; &nbsp;进度图片：
                                    <div style="width: 100%; height: 100%;" id="otherImagesDiv">
                                        </div>
                                    
                                   
                                </div>
                            </td>
                            
                        </tr>
                    </table>

                      <br />
                    <div id="printDiv" class="hidden-div" ">
                       <table style="width: 100%; margin: auto" class="progressTable"   >
                            <tr>
                                <td class="printOrderName" colspan="3" id="orderName3">
                                      这是订单名称
                                </td>
                                <td  colspan="1" style="margin: auto; text-align: right;">
                                    <img style="width: 60px; height: 60px;"
                       src="data:image/png;base64,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" />
                                </td>
                            </tr>

                        </table>
                       <table style="width: 100%; margin: auto" id="printTable">
                        <tr>
                            <td style="width: 11%; text-align: center">淘宝ID：</td>
                            <td id="taobaoId2" style="width: 39%;"> </td>
                            <td style="width: 11% ;  text-align: center">接单人：</td>
                            <td id="receiveOrderPerson2"  style="width: 39%;"> </td>
                        </tr>

                        <tr>
                            <td style="width: 11%; text-align: center">订单名称：</td>
                            <td id="orderName2"  style="width: 39%;"> </td>
                            <td style="width: 11% ;  text-align: center">金额：</td>
                            <td id="amount2"  style="width: 39%;"> </td>
                        </tr>

                        <tr>
                            <td style="width: 11%; text-align: center">接单时间：</td>
                            <td id="orderDate2"  style="width: 39%;"> </td>
                            <td style="width: 11% ;  text-align: center">发货时间：</td>
                            <td id="deliveryDate2"  style="width: 39%;"></td>
                        </tr>

                        <tr>
                            <td style="width: 11%; text-align: center">款式：</td>
                            <td id="style2"  style="width: 39%;"> </td>
                            <td style="width: 11% ;  text-align: center">雕刻方式：</td>
                            <td id="carveStyle2"  style="width: 39%;"></td>
                        </tr>

                        <tr>
                            <td style="width: 11%; text-align: center">材质：</td>
                            <td id="material2" colspan="3" > </td>
                        </tr>

                        <tr>
                            <td style="width: 11%; text-align: center" class="size-print">尺寸：</td>
                            <td id="size2" colspan="3" class="size-print"></td>
                        </tr>
                        <tr>
                            <td style="width: 11%; text-align: center">颜色：</td>
                            <td colspan="3" id="color2"> </td>
    
                        </tr>
                        
                        <tr>
                            <td style="width: 11%; text-align: center">物流方式：</td>
                            <td colspan="3" id="delivery2"> </td>
    
                        </tr>
                         <tr class ="">
                            <td  style="width: 11%; text-align: center;">备注：</td>
                            <td colspan="3" id="memo2" style="font-weight: bold;"> </td>
                        </tr>
                        <tr class ="addressLine">
                            <td  style="width: 11%; text-align: center">收货人：</td>
                            <td colspan="3" id="address2"> </td>
                        </tr>
                       
  
              
                    </table>
                    </div>
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
   
    <script src="../My97DatePicker/WdatePicker.js"></script>

    <script src="./js/print.min.js" ></script>

    <script src="./js/lodash.js"></script>
    <script src="./js/site.js?id=1"></script>
     <script src="./js/order.js?id=2"></script>

     <script src="../build/js/custom.min.js"></script>
</asp:Content>



