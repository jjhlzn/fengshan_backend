<%@ Page Title="" Language="C#" MasterPageFile="~/admin/production/admin.Master"  AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="fengshan.admin.production.orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
   <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
     <div class="">
           

            <div class="clearfix"></div>

            <div class="row">

              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>订单列表 <small></small></h2>
                    
                    <div class="clearfix"></div>
                  </div>

                  <div class="x_content">

              

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">订单编号 </th>
                            <th class="column-title">订单名称 </th>
                            <th class="column-title">发货时间 </th>
                            <th class="column-title">下单时间 </th>
                            
                            <th class="column-title">金额 </th>
                            <th class="column-title">接单人 </th>
                            <th class="column-title no-link last"><span class="nobr"></span>
                            </th>
                            <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">2018-10-01</td>
                            <td class=" ">2018-10-01 </td>
                            <td class=" ">牌匾</td>
                            <td class=" ">100元</td>
                            <td class="a-right a-right ">小张</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">2018-10-01</td>
                            <td class=" ">2018-10-01 </td>
                            <td class=" ">牌匾</td>
                            <td class=" ">100元</td>
                            <td class="a-right a-right ">小张</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                           <td class=" ">121000040</td>
                            <td class=" ">2018-10-01</td>
                            <td class=" ">2018-10-01 </td>
                            <td class=" ">牌匾</td>
                            <td class=" ">100元</td>
                            <td class="a-right a-right ">小张</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">2018-10-01</td>
                            <td class=" ">2018-10-01 </td>
                            <td class=" ">牌匾</td>
                            <td class=" ">100元</td>
                            <td class="a-right a-right ">小张</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">2018-10-01</td>
                            <td class=" ">2018-10-01 </td>
                            <td class=" ">牌匾</td>
                            <td class=" ">100元</td>
                            <td class="a-right a-right ">小张</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">2018-10-01</td>
                            <td class=" ">2018-10-01 </td>
                            <td class=" ">牌匾</td>
                            <td class=" ">100元</td>
                            <td class="a-right a-right ">小张</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">2018-10-01</td>
                            <td class=" ">2018-10-01 </td>
                            <td class=" ">牌匾</td>
                            <td class=" ">100元</td>
                            <td class="a-right a-right ">小张</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">2018-10-01</td>
                            <td class=" ">2018-10-01 </td>
                            <td class=" ">牌匾</td>
                            <td class=" ">100元</td>
                            <td class="a-right a-right ">小张</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>

                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">2018-10-01</td>
                            <td class=" ">2018-10-01 </td>
                            <td class=" ">牌匾</td>
                            <td class=" ">100元</td>
                            <td class="a-right a-right ">小张</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                          <tr class="odd pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class=" ">121000040</td>
                            <td class=" ">2018-10-01</td>
                            <td class=" ">2018-10-01 </td>
                            <td class=" ">牌匾</td>
                            <td class=" ">100元</td>
                            <td class="a-right a-right ">小张</td>
                            <td class=" last"><a href="#">View</a>
                            </td>
                          </tr>
                        </tbody>
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
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
</asp:Content>

