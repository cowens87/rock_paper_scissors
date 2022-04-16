class Merchant < ApplicationRecord
  validates_presence_of :name

  enum status: ['Enabled', 'Disabled']

  has_many :items, dependent: :destroy
  has_many :discounts, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :items

  def top_five_customers
    self.transactions.joins(invoice: :customer)
      .where('transactions.result = ?', "success")
      .select('customers.first_name, COUNT(transactions) AS successful_transactions')
      .group('customers.id')
      .order('successful_transactions desc')
      .limit(5)
  end

  def items_ready_to_ship
    items.joins(:invoice_items).where.not('invoice_items.status = ?', 2)
  end

  def order_merchant_items_by_invoice_created_date(items)
    items.joins(:invoices).where('invoices.merchant_id = ?', self.id).order('invoices.created_at ASC')
  end

  def self.enabled_merchants
    where('status = ?', 0).order(:name)
  end

  def self.disabled_merchants
    where('status = ?', 1).order(:name)
  end

  def self.top_five_merchants
    self.joins([invoices: :transactions], :invoice_items)
    .where('transactions.result = ?', "success")
    .select("merchants.id, merchants.name, SUM(invoice_items.unit_price * invoice_items.quantity) as total_revenue")
    .group('merchants.id')
    .order('total_revenue desc')
    .limit(5)
  end

  def enabled_items
    items.where(status: 'Enabled')
  end

  def disabled_items
    items.where(status: 'Disabled')
  end
 # Individual Project Methods:
  def discount_amount?(items_on_invoice)
    discount_total = 0
    items_on_invoice.each do |item|
      item_qty = item.quantity
      applicable_discounts = discounts.where('quantity_threshold <= ?', item_qty)
      if !self.discounts.empty? && !applicable_discounts.empty?
        item_total = item.quantity * item.unit_price
        discount_total += (item_total * (applicable_discounts.maximum(:discount_percentage)/100))
      else
        discount_total += 0
      end
    end
    discount_total
  end

  def total_discount
    x = invoice_items.joins(:bulk_discounts)
          .select("invoice_items.id, max(invoice_items.unit_price * invoice_items.quantity * (bulk_discounts.discount / 100.00)) as total_discount")
          .where("invoice_items.quantity >= bulk_discounts.quantity_threshold")
          .group("invoice_items.id")
          .order("total_discount desc")
          .sum(&:"total_discount")
    total_revenue - x
  end

  def discount_eligible?(invoice_item)
    discounts.where('quantity_threshold <= ?', invoice_item.quantity)
  end

  def discount_applied(invoice_item)
    discount_eligible?(invoice_item).select('id','discount_percentage')
      .order(discount_percentage: :desc)
      .first
  end


