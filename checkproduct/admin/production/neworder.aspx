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
    <!--<link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet"> -->
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

     <link href="./css/dropzone.css" rel="stylesheet">
    <link href="./css/neworder.css" rel="stylesheet">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="formdiv" class="right_col" role="main" data-parsley-validate="">
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
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">淘宝ID
                        </label>
                       <div class="col-md-2 col-sm-2 col-xs-4">
                          <input type="text" id="taobaoId" required="" data-parsley-errors-messages-disabled="" class="form-control col-md-7 col-xs-12">
                        </div>

                        <label class="control-label col-md-2 col-sm-2 col-xs-4" for="last-name">接单人
                        </label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select id="receiveOrderPerson" required="" data-parsley-errors-messages-disabled="" class="select2_single form-control" tabindex="-1">
                            <option value="">选择接单人</option>
                            <option value="小刘">小刘</option>
                            <option value="小王">小王</option>
                            <option value="小潘">小潘</option>
                              <option value="小金">小金</option>
                              <option value="小陆">小陆</option>
                              <option value="小胡">小胡</option>
                              <option value="金鹏">金鹏</option>
                              <option value="胡亚非">胡亚非</option>
                               <option value="金国平">金国平</option>

                          </select>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">订单名称
                        </label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <input type="text" id="orderName" required="" data-parsley-errors-messages-disabled="" class="form-control col-md-7 col-xs-12">
                        </div>

                        <label class="control-label col-md-2 col-sm-2 col-xs-4"  for="first-name">金额
                        </label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <input type="text" id="amount" required="" data-parsley-errors-messages-disabled="" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>



                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">接单时间</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <input id="orderDate" class="form-control col-md-3 col-xs-12" type="text" name="middle-name" required="" data-parsley-errors-messages-disabled=""
                              onclick="WdatePicker({minDate:'2017-01-01',maxDate:'2020-12-31'})">
                        </div>

                        <label for="middle-name" class="control-label col-md-2 col-sm-2 col-xs-4">发货时间</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <input id="deliveryDate" class="form-control col-md-3 col-xs-12" type="text" name="middle-name"  required="" data-parsley-errors-messages-disabled=""
                              onclick="WdatePicker({minDate:'2017-01-01',maxDate:'2020-12-31'})">
                        </div>
                      </div>


                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">款式</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="style" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择款式</option>
                            <option value="规则">规则</option>
                            <option value="不规则">不规则</option>
                              <option value="圆">圆</option>
                            <option value="其他">其他</option>

                          </select>
                        </div>

                        <label for="middle-name" class="control-label col-md-2 col-sm-2 col-xs-4">雕刻方式</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="carveStyle" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择雕刻方式</option>
                            <option value="阴包阳">阴包阳</option>
                            <option value="圆弧阴雕">圆弧阴雕</option>
                              <option value="直角阴雕">直角阴雕</option>
                              <option value="圆弧阴雕">圆弧阴雕</option>
                              <option value="直角阳雕">直角阳雕</option>
                              <option value="其他">其他</option>
                          </select>
                        </div>
                      </div>

                    <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">材质</label>
                        <div class="col-md-2 col-sm-4 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="material" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择材质</option> 
                            <option value="樟子松">樟子松</option>
                            <option value="红松">红松</option>
                            <option value="香樟木">香樟木</option>
                            <option value="榆木">榆木</option>
                            <option value="菠萝格">菠萝格</option>
                            <option value="红花梨">红花梨</option>
                            <option value="其他">其他</option>
                          </select>
                        </div>

                        <div class="col-md-2 col-sm-2 col-xs-2">
                          <select class="select2_single form-control" tabindex="-1" id="isDuban" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择是否独板</option> 
                            <option value="独板">独板</option>
                            <option value="不是独板">不是独板</option>
                          </select>
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">尺寸</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="size" class="form-control col-md-7 col-xs-12" type="text" name="middle-name" required="" data-parsley-errors-messages-disabled="">
                        </div>
                      </div>

          

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">颜色</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="color" class="form-control col-md-7 col-xs-12" type="text" name="middle-name" required="" data-parsley-errors-messages-disabled="">
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">物流方式</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="deliveryCompany" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择物流</option>
                            <option value="顺丰">顺丰</option>
                            <option value="德邦快递">德邦快递</option>
                              <option value="德邦物流电商冲减">德邦物流电商冲减</option>
                              <option value="德邦物流普通自提">德邦物流普通自提</option>
                              <option value="中通物流">中通物流</option>
                              <option value="百世物流">百世物流</option>
                              <option value="安能物流">安能物流</option>
                              <option value="专线托运">专线托运</option>
                              <option value="其他">其他</option>
                          </select>
                        </div>
                         <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="deliveryPayType" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择支付方式</option>
                            <option value="包邮">包邮</option>
                            <option value="到付">到付</option>
                          </select>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="deliveryPackage" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择打包方式</option>
                            <option value="打木架">打木架</option>
                            <option value="不打木架">不打木架</option>
                          </select>
                        </div>
                      </div>

                     <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">收货人地址</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <textarea id="address" class="form-control" rows="2" placeholder='输入地址' required="" data-parsley-errors-messages-disabled=""></textarea>
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <textarea id="meno" class="form-control" rows="2" placeholder='输入备注'></textarea>
                        </div>
                     </div>

                    <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">内容图片</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <form action="/upload.aspx"
                              class="dropzone dz-message"
                              id="my-awesome-dropzone"></form>
                        </div>
                     </div>

                    <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">内容图片</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <form action="/upload.aspx"
                              class="dropzone"
                              id="my-awesome-dropzone2"></form>
                        </div>
                     </div>
                   

                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-success " onclick="submitForm()">提交</button>
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
    
    <script src="../My97DatePicker/WdatePicker.js"></script>
     <script src="./js/lodash.js"></script>



     <script src="./js/dropzone.js"></script>
     <script src="./js/neworder.js"></script>

    <script src="../build/js/custom.min.js"></script> 
</asp:Content>

