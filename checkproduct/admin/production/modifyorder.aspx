﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/production/admin.Master"  AutoEventWireup="true" CodeBehind="modifyorder.aspx.cs" Inherits="fengshan.admin.production.modifyorder" %>

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
    <link href="./css/modifyorder.css" rel="stylesheet">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="formdiv" class="right_col" role="main" data-parsley-validate="">
     <div class="">
        
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>修改订单 <small></small></h2>
                    <div class="nav navbar-right panel_toolbox">
                            <button class="btn btn-primary "  onclick="window.history.back();return false;">返回</button>
                    </div>
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
                              <% foreach (fengshan.DomainModel.ConfigItem item in fengshan.DomainModel.Config.JDR.items)
                                  { %>
                                <option value="<%= item.value %>"><%= item.name %></option>
                              <% } %>
                            
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
                          <input id="orderDate" class="form-control col-md-3 col-xs-12" type="text"  required="" data-parsley-errors-messages-disabled=""
                              onclick="WdatePicker({minDate:'2017-01-01',maxDate:'2020-12-31'})">
                        </div>

                        <label for="middle-name" class="control-label col-md-2 col-sm-2 col-xs-4">发货时间</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <input id="deliveryDate" class="form-control col-md-3 col-xs-12" type="text"   required="" data-parsley-errors-messages-disabled=""
                              onclick="WdatePicker({minDate:'2017-01-01',maxDate:'2020-12-31'})">
                        </div>
                      </div>


                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">款式</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="style" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择款式</option>
                            <% foreach (fengshan.DomainModel.ConfigItem item in fengshan.DomainModel.Config.KS.items)
                                  { %>
                                <option value="<%= item.value %>"><%= item.name %></option>
                              <% } %>

                          </select>
                        </div>

                        <label for="middle-name" class="control-label col-md-2 col-sm-2 col-xs-4">雕刻方式</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="carveStyle" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择雕刻方式</option>
                            <% foreach (fengshan.DomainModel.ConfigItem item in fengshan.DomainModel.Config.DKFS.items)
                                  { %>
                                <option value="<%= item.value %>"><%= item.name %></option>
                              <% } %>
                          </select>
                        </div>
                      </div>

                    <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">材质</label>
                        <div class="col-md-2 col-sm-4 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="material" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择材质</option> 
                            <% foreach (fengshan.DomainModel.ConfigItem item in fengshan.DomainModel.Config.CZ.items)
                                  { %>
                                <option value="<%= item.value %>"><%= item.name %></option>
                              <% } %>
                          </select>
                        </div>

                        <div class="col-md-2 col-sm-2 col-xs-2">
                          <select class="select2_single form-control" tabindex="-1" id="isDuban" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择是否独板</option> 
                            <% foreach (fengshan.DomainModel.ConfigItem item in fengshan.DomainModel.Config.CZDB.items)
                                  { %>
                                <option value="<%= item.value %>"><%= item.name %></option>
                              <% } %>
                          </select>
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">尺寸</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="size" class="form-control col-md-7 col-xs-12" type="text" required="" data-parsley-errors-messages-disabled="">
                        </div>
                      </div>

          

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">颜色</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="color" class="form-control col-md-7 col-xs-12" type="text" required="" data-parsley-errors-messages-disabled="">
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">物流方式</label>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="deliveryCompany" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择物流</option>
                            <% foreach (fengshan.DomainModel.ConfigItem item in fengshan.DomainModel.Config.WLGS.items)
                                  { %>
                                <option value="<%= item.value %>"><%= item.name %></option>
                              <% } %>
                          </select>
                        </div>
                         <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="deliveryPayType" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择支付方式</option>
                            <% foreach (fengshan.DomainModel.ConfigItem item in fengshan.DomainModel.Config.WLZFFS.items)
                                  { %>
                                <option value="<%= item.value %>"><%= item.name %></option>
                              <% } %>
                          </select>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-4">
                          <select class="select2_single form-control" tabindex="-1" id="deliveryPackage" required="" data-parsley-errors-messages-disabled="">
                            <option value="">选择打包方式</option>
                            <% foreach (fengshan.DomainModel.ConfigItem item in fengshan.DomainModel.Config.WLDBFS.items)
                                  { %>
                                <option value="<%= item.value %>"><%= item.name %></option>
                              <% } %>
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
                           <textarea id="memo" class="form-control" rows="2" placeholder='输入备注'></textarea>
                        </div>
                     </div>

                    <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">内容图片</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <form action="/upload.aspx"
                              class="dropzone dz-message"
                              id="my-awesome-dropzone"></form> 
                            
                            <input type="radio" name="pastePosition" checked="checked" id="contentRadio"> 复制到内容图片
                        </div>
                     </div>

                    <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12">底色样板图片</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                           <form action="/upload.aspx"
                              class="dropzone"
                              id="my-awesome-dropzone2"></form> 
                             <input type="radio" name="pastePosition" id="templateRadio" > 复制到底色样板图片
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

     <script src="./js/site.js?id=1"></script>
     <script src="./js/modifyorder.js?id=2"></script>

    <script src="../build/js/custom.min.js"></script> 
</asp:Content>

