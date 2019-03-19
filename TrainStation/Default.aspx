<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TrainStation._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="Scripts/inputmask.js"></script>
    <script src="Scripts/inputmask.extensions.js"></script>
    <script src="Scripts/inputmask.numeric.extensions.js"></script>
    <script src="Scripts/inputmask.date.extensions.js"></script>
    <script src="Scripts/jquery.inputmask.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#TB").inputmask("datetime",
                {
                    inputFormat: "dd/mm/yyyy",
                    placeholder: "dd.mm.yyyy",
				    min: "01.01.2019",
                    max: "31.12.2030"
                })
            $("#CoupeCount").inputmask("99", { placeholder: "" })
            $("#NotACoupeCount").inputmask("99", { placeholder: "" })

        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".test input:checkbox").on('change', function () {
                $(".test input:checkbox").not(this).prop('checked', false);
            });
        });

    </script>

    <br />
    <div>
        <asp:Table ID="maintable" runat="server" HorizontalAlign="Center"> 
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left" >Пункт назначения</asp:TableCell><asp:TableCell HorizontalAlign="Center" Width="200" Height="50"><asp:DropDownList runat="server" ID="DropdownList1" Width="150" Height="25">
                    <asp:ListItem>Москва</asp:ListItem>
                    <asp:ListItem>Уфа</asp:ListItem>
                    <asp:ListItem>Сочи</asp:ListItem>
                    <asp:ListItem>Екатеринбург</asp:ListItem>
                    <asp:ListItem>Новосибирск</asp:ListItem>
                                                                                                                                                       </asp:DropDownList></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">Дата отправления</asp:TableCell><asp:TableCell HorizontalAlign="Center" Width="200"  Height="50"><asp:TextBox ID="TB" runat="server" ClientIDMode="static" Width="150"  Height="25"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">Мест купе</asp:TableCell><asp:TableCell HorizontalAlign="Center" Width="200"  Height="50"><asp:TextBox ID="CoupeCount" runat="server" ClientIDMode="static" Width="150" Height="25"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Left">Мест плацкарт</asp:TableCell><asp:TableCell HorizontalAlign="Center" Width="200"  Height="50"><asp:TextBox ID="NotACoupeCount" runat="server" ClientIDMode="static" Width="150" Height="25"></asp:TextBox></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell></asp:TableCell><asp:TableCell HorizontalAlign="Center" Width="200"  Height="50"><asp:Button ID="Button1"  runat="server" Text="Submit" OnClick="Button1_Click" Width="150" Height="25"/></asp:TableCell>
            </asp:TableRow>
        </asp:Table>        
    </div>
    <asp:Table runat="server" HorizontalAlign="Center"> </asp:Table>

    <div>
        <asp:Table ID="headerT" runat="server" HorizontalAlign="Center" Visible="false" Font-Bold="True" Font-Italic="False"> 
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center" Width="30px" Height="40" VerticalAlign="Middle"></asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="30px">Рейс</asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100">Поезд</asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100">Направление</asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100">Отправление</asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100">Прибытие</asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100">Купе</asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100">Плацкарт</asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" GridLines="None" ShowHeader="False" CellPadding="4" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
                <asp:TemplateField ItemStyle-Width="30" ItemStyle-HorizontalAlign="Center"> 
                <ItemTemplate>
                    <asp:CheckBox ID = "chkRow" runat = "server" Class="test"/>
                </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                </asp:TemplateField>
            <asp:BoundField DataField="ID">
                    <ItemStyle HorizontalAlign="Center" Width="30" />
                </asp:BoundField>
            <asp:BoundField DataField="NumberTrain">
                    <ItemStyle HorizontalAlign="Center" Width="100" />
                </asp:BoundField>
            <asp:BoundField DataField="Direction">
                    <ItemStyle HorizontalAlign="Center" Width="100" />
                </asp:BoundField>
            <asp:BoundField DataField="DateDeparture">
                    <ItemStyle HorizontalAlign="Center" Width="100" />
                </asp:BoundField>
            <asp:BoundField DataField="DateArrival">
                    <ItemStyle HorizontalAlign="Center" Width="100" />
                </asp:BoundField>
            <asp:BoundField DataField="CoupeCount">
                    <ItemStyle HorizontalAlign="Center" Width="100" />
                </asp:BoundField>
            <asp:BoundField DataField="NotACoupeCount">
                    <ItemStyle HorizontalAlign="Center" Width="100" />
                </asp:BoundField>

        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <br />

        <div>
        <asp:Table ID="tbtn" runat="server" HorizontalAlign="Center" Visible="false"> 
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center" Width="30px"></asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="30px"></asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100"></asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100"></asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100"></asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100"></asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100"></asp:TableCell>
                <asp:TableCell HorizontalAlign="Center" Width="100"><asp:Button runat="server" ID="b2" Width="100" Text="Бронь" OnClick="b2_Click"/></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

        <br />

        <div>
        <asp:Table ID="labletable" runat="server" HorizontalAlign="Center" Visible="false"> 
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

</asp:Content>
