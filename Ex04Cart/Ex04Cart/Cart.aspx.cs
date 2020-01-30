using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ex04Cart
{
    public partial class Cart : System.Web.UI.Page
    {
        private CartItemList itemList;

        protected void Page_Load(object sender, EventArgs e)
        {
            itemList = CartItemList.GetCart();
            if(!IsPostBack)
                this.DisplayCart();
        }

        private void DisplayCart()
        {
            lstCart.Items.Clear();
            if (itemList.Count > 0)
            {
                for (int i = 0; i < itemList.Count; i++)
                {
                    lstCart.Items.Add(itemList[i].Display());
                }
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (itemList.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    itemList.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                {
                    lblMessage.Text = "Please select a product to remove";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            itemList.Clear();
            lstCart.Items.Clear();
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "Sorry, this fuction hasn't been implemented yet.";
        }
    }
}