db.createCollection("product_infos");

db.getCollection("product_infos").insertOne({
  id: 1,
  prod_id: "Product_1",
  prod_name: "Notebook",
  prod_price: 5,
  prod_stock : 100,
  prod_quantity: 50,
  vendor_name : "abc",
  vendor_id: 712,
  date_added: "2023-12-06T00:00:00Z",
  created_by: "interns",
  updated_by: "interns",
  created_date: "2023-12-06T00:00:00Z",
  updated_date: "2023-12-06T00:00:00Z"
});

db.getCollection("product_infos").find({})

db.getCollection("product_infos").insertMany([
  {
    id: 2,
    prod_id: "Product_2",
    prod_name: "Ballpoint Pen",
    prod_price: 1,
    prod_stock : 1000,
    prod_quantity: 100,
    vendor_name: "xyz",
    vendor_id: 192,
    date_added: "2023-12-06T00:00:00Z",
    created_by: "interns",
    updated_by: "interns",
    created_date: "2023-12-06T00:00:00Z",
    updated_date: "2023-12-06T00:00:00Z"
  },
  {
    id: 3,
    prod_id: "Product_3",
    prod_name: "Sticky Notes",
    prod_price: 2,
    prod_stock : 1009,
    prod_quantity: 75,
    vendor_name: "pqr",
    vendor_id: 162,
    date_added: "2023-12-06T00:00:00Z",
    created_by: "interns",
    updated_by: "interns",
    created_date: "2023-12-06T00:00:00Z",
    updated_date: "2023-12-06T00:00:00Z"
  },
  {
    id: 4,
    prod_id: "Product_4",
    prod_name: "Paper Clips",
    prod_price: 0.5,
    prod_stock : 200,
    prod_quantity: 200,
    vendor_name: "lmn",
    vendor_id: 182,
    date_added: "2023-12-06T00:00:00Z",
    created_by: "interns",
    updated_by: "interns",
    created_date: "2023-12-06T00:00:00Z",
    updated_date: "2023-12-06T00:00:00Z"
  },
  {
    id: 5,
    prod_id: "Product_5",
    prod_name: "Whiteboard Markers",
    prod_price: 3,
    prod_stock : 1010,
    prod_quantity: 30,
    vendor_name: "uvw",
    vendor_id: 127,
    date_added: "2023-12-06T00:00:00Z",
    created_by: "interns",
    updated_by: "interns",
    created_date: "2023-12-06T00:00:00Z",
    updated_date: "2023-12-06T00:00:00Z"
  },
  {
    id: 6,
    prod_id: "Product_6",
    prod_name: "Scissors",
    prod_price: 4,
    prod_stock : 300,
    prod_quantity: 40,
    vendor_name: "rst",
    vendor_id: 125,
    date_added: "2023-12-06T00:00:00Z",
    created_by: "interns",
    updated_by: "interns",
    created_date: "2023-12-06T00:00:00Z",
    updated_date: "2023-12-06T00:00:00Z"
  },
  {
    id: 7,
    prod_id: "Product_7",
    prod_name: "Highlighters",
    prod_price: 2.5,
    prod_stock : 102,
    prod_quantity: 60,
    vendor_name: "efg",
    vendor_id: 102,
    date_added: "2023-12-06T00:00:00Z",
    created_by: "interns",
    updated_by: "interns",
    created_date: "2023-12-06T00:00:00Z",
    updated_date: "2023-12-06T00:00:00Z"
  },
  {
    id: 8,
    prod_id: "Product_8",
    prod_name: "Desk Organizer",
    prod_price: 8,
    prod_stock : 130,
    prod_quantity: 20,
    vendor_name: "ijk",
    vendor_id: 13,
    date_added: "2023-12-06T00:00:00Z",
    created_by: "interns",
    updated_by: "interns",
    created_date: "2023-12-06T00:00:00Z",
    updated_date: "2023-12-06T00:00:00Z"
  },
  {
    id: 9,
    prod_id: "Product_9",
    prod_name: "Binder Clips",
    prod_price: 1.5,
    prod_stock : 103,
    prod_quantity: 90,
    vendor_name: "hij",
    vendor_id: 12,
    date_added: "2023-12-06T00:00:00Z",
    created_by: "interns",
    updated_by: "interns",
    created_date: "2023-12-06T00:00:00Z",
    updated_date: "2023-12-06T00:00:00Z"
  }
]);

db.getCollection("product_infos").find({})

db.getCollection("product_infos").updateOne(
  { prod_id: "Product_9" },
  {
    $set: {
      prod_quantity: 100,
      updated_by: "interns",
      updated_date: "2023-12-07T00:00:00Z"
    }
  }
);


db.getCollection("product_infos").find({ "prod_name": "Binder Clips" });

const maxQuantityResult = db.getCollection("product_info").aggregate([
  {
    $group: {
      _id: "$id",
      maxQuantity: { $max: "$prod_quantity" }
    }
  }
]);

db.product_details.aggregate([
  {
    $group: {
      _id: "$vendor_id",
      total_stock: { $sum: "$prod_stock" }
    }
  }
]);


db.product_details.aggregate([
  {
    $count: "totalDocuments"
  }
]);

db.product_info.aggregate([
  {
    $match: {
      prod_id: "Product_9"
    }
  },
  {
    $group: {
      _id: "$vendor_id",
      total_stock: { $sum: "$prod_stock" }
    }
  }
]);

db.product_info.find({ prod_name: "Desk Organizer" });

db.getCollection("product_infos").find({prod_name: "Desk Organizer"})

