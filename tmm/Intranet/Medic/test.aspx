<%@ Page Language="C#" AutoEventWireup="True" %>
<html>
<head>
   <script runat="server">
      void Page_Load(Object sender, EventArgs e) 
      {
         int row = 0;
         // Generate rows and cells.
         int numrows = Convert.ToInt32(Select1.Value);
         int numcells = Convert.ToInt32(Select2.Value);
         for (int j=0; j<numrows; j++) 
         {
            HtmlTableRow r = new HtmlTableRow();
            // Set bgcolor on alternating rows.
            if (row%2 == 1)
               r.BgColor="Gainsboro";
            row++;
            for (int i=0; i<numcells; i++) 
            {
               HtmlTableCell c = new HtmlTableCell();
               c.Controls.Add(new LiteralControl("row " + j.ToString() +
                              ", cell " + i.ToString()));
               r.Cells.Add(c);
            }
            Table1.Rows.Add(r);
         }
      }
   </script>
</head>
<body>  
   <h3>HtmlTable Example</h3>
   <form runat="server">
      <p>
      <table id="Table1" 
             CellPadding=5 
             CellSpacing=0 
             Border="1" 
             BorderColor="black" 
             runat="server" /> 
      <p>
      Table rows:
      <select id="Select1" runat="server">
         <option Value="1">1</option>
         <option Value="2">2</option>
         <option Value="3">3</option>
         <option Value="4">4</option>
         <option Value="5">5</option>
      </select>
      <br>
      Table cells:
      <select id="Select2" runat="server">
         <option Value="1">1</option>
         <option Value="2">2</option>
         <option Value="3">3</option>
         <option Value="4">4</option>
         <option Value="5">5</option>
      </select>
      <input type="submit" value="Generate Table" runat="server">
   </form>
</body>
</html>