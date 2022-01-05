require 'csv'
require 'rake'

namespace :csv_load do
  task all: [:merchant, :customer, :item, :invoice, :transaction, :invoice_item]
  
  task :merchant => :environment do
    load_csv_files(Merchant, 'db/data/merchants.csv')
    puts "Merchant load completed"
  end
 
  task :customer => :environment do
    load_csv_files(Customer, 'db/data/customers.csv')
    puts "Customer load completed"
  end
  
  task :item => :environment do
    load_csv_files(Item, 'db/data/items.csv')
    puts "Item load completed"
  end
  
  task :invoice => :environment do
    load_csv_files(Invoice, 'db/data/invoices.csv')
    puts "Invoice load completed"
  end
  
  task :transaction => :environment do
    load_csv_files(Transaction, 'db/data/transactions.csv')
    puts "Transaction load completed"
  end
  
  task :invoice_item => :environment do
    load_csv_files(InvoiceItem, 'db/data/invoice_items.csv')
    puts "Invoice Item load completed"
  end

  def load_csv_files(model, file_path)
    CSV.foreach(file_path, headers: true) do |row|
        model.create!(row.to_hash)
    end
  end

reset the id sequence
  # coding for enum functions
  # def load_csv_files(model, file_path)
  #   CSV.foreach(file_path, headers: true) do |row|
  #     if file_path == ('/db/data/transactions.csv') && row.to_hash['result'] == success
  #       result = 0
  #       model.create!(row.to_hash)
  #     elsif file_path == ('/db/data/transactions.csv') && row.to_hash['result'] == failed
  #       result = 1
  #       model.create!(row.to_hash)
  #   end
  # end
end
