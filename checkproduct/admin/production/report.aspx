<%@ Page Title="" Language="C#" MasterPageFile="~/admin/production/admin.Master"  AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="fengshan.admin.production.report" %>

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


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="formdiv" class="right_col" role="main" data-parsley-validate="">
     <div class="">
        
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>订单统计 <small></small></h2>
              
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content" style="height: 600px; color: orangered;">
                    



                      <div class="row tile_count">
                            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                              <span class="count_top" style="text-align: center; color: gray;"> 未完成订单数 </span>
                              <div class="count green" id="notFinishedOrderCount">0</div>
                              <span class="count_bottom"></span>
                            </div>

                          <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
                              <span class="count_top" style="text-align: center;  color: gray;"> 超过发货时间订单数 </span>
                              <div class="count red" id="timeoutOrderCount">0</div>
                              <span class="count_bottom"></span>
                            </div>
                  </div>


                      <div class="row" style="border-top-width:1px; border-top-style: solid;border-top-color: lightgray; height: 220px;">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                  <div class="dashboard_graph">

                                       <canvas id="orderChart"  style="height: 80px; width: 300px;"></canvas>
                                    
                                    
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
    <script src="./js/chart.js"></script>
    <script src="./js/report.js"></script>
        <!-- Bootstrap -->

     

     

</asp:Content>

