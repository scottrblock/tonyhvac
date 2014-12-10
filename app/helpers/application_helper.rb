module ApplicationHelper
  def contractor_hash
    contractors = {}
    Contractor.all.each do |c|
      full_name = "#{c.subFirstName} #{c.subLastName}"
      if full_name.length > 1
        contractors[c.id] = full_name
      end
    end
    contractors
  end

  def item_hash
    items = {}
    Item.all.each do |i|
      if i.title.length > 1
        items[i.title] = i.id
      end
    end
    items
  end

  def current_resource
    current_resource = nil

    if resource_type == "customers"
      current_resource = current_customer
    elsif resource_type == "contractors"
      current_resource = current_contractor
    elsif resource_type == "admins"
      current_resource = current_admin
    end
    current_resource
  end

  def resource_type
    resource_type = ""
    if (defined? customer_signed_in?) && customer_signed_in?
      resource_type = "customers"
    end

    if (defined? admin_signed_in?) && admin_signed_in?
      resource_type = "admins"
    end

    if (defined? contractor_signed_in?) && contractor_signed_in?
      resource_type = "contractors"
    end

    resource_type
  end

  def us_states
      [
        ['Alabama', 'AL'],
        ['Alaska', 'AK'],
        ['Arizona', 'AZ'],
        ['Arkansas', 'AR'],
        ['California', 'CA'],
        ['Colorado', 'CO'],
        ['Connecticut', 'CT'],
        ['Delaware', 'DE'],
        ['District of Columbia', 'DC'],
        ['Florida', 'FL'],
        ['Georgia', 'GA'],
        ['Hawaii', 'HI'],
        ['Idaho', 'ID'],
        ['Illinois', 'IL'],
        ['Indiana', 'IN'],
        ['Iowa', 'IA'],
        ['Kansas', 'KS'],
        ['Kentucky', 'KY'],
        ['Louisiana', 'LA'],
        ['Maine', 'ME'],
        ['Maryland', 'MD'],
        ['Massachusetts', 'MA'],
        ['Michigan', 'MI'],
        ['Minnesota', 'MN'],
        ['Mississippi', 'MS'],
        ['Missouri', 'MO'],
        ['Montana', 'MT'],
        ['Nebraska', 'NE'],
        ['Nevada', 'NV'],
        ['New Hampshire', 'NH'],
        ['New Jersey', 'NJ'],
        ['New Mexico', 'NM'],
        ['New York', 'NY'],
        ['North Carolina', 'NC'],
        ['North Dakota', 'ND'],
        ['Ohio', 'OH'],
        ['Oklahoma', 'OK'],
        ['Oregon', 'OR'],
        ['Pennsylvania', 'PA'],
        ['Puerto Rico', 'PR'],
        ['Rhode Island', 'RI'],
        ['South Carolina', 'SC'],
        ['South Dakota', 'SD'],
        ['Tennessee', 'TN'],
        ['Texas', 'TX'],
        ['Utah', 'UT'],
        ['Vermont', 'VT'],
        ['Virginia', 'VA'],
        ['Washington', 'WA'],
        ['West Virginia', 'WV'],
        ['Wisconsin', 'WI'],
        ['Wyoming', 'WY']
      ]
  end

  def projected_revenue
    r = 0.00
    Job.all.each do |j|
      r += j.post_tax_cost
    end

    r
  end

  def received_revenue
    r = 0.00
    Job.all.each do |j|
      if j.invoice_status == "paid"
        r += j.post_tax_cost
      end
    end

    r
  end
end
