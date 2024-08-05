<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IT Parts Inventory Birlasoft</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin: 10px 0 5px;
        }

        input {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            padding: 10px;
            background-color: #f9f9f9;
            margin-bottom: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>IT Parts Inventory Birlasoft ICTS</h1>
        <form id="inventoryForm">
            <label for="partName">Part Name:</label>
            <input type="text" id="partName" name="partName" required>
            
            <label for="partNumber">Part Number:</label>
            <input type="text" id="partNumber" name="partNumber" required>
            
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>
            
            <button type="submit">Add Part</button>
        </form>
        <h2>Inventory List</h2>
        <ul id="inventoryList"></ul>
    </div>
    <script>
        document.getElementById('inventoryForm').addEventListener('submit', function(event) {
            event.preventDefault();
            
            const partName = document.getElementById('partName').value;
            const partNumber = document.getElementById('partNumber').value;
            const quantity = document.getElementById('quantity').value;
            
            const inventoryList = document.getElementById('inventoryList');
            const listItem = document.createElement('li');
            listItem.textContent = `Part Name: ${partName}, Part Number: ${partNumber}, Quantity: ${quantity}`;
            
            inventoryList.appendChild(listItem);
            
            saveToDatabase({ partName, partNumber, quantity });
            
            document.getElementById('inventoryForm').reset();
        });

        function saveToDatabase(entry) {
            let database = localStorage.getItem('inventoryDatabase');
            if (!database) {
                database = [];
            } else {
                database = JSON.parse(database);
            }
            
            database.push(entry);
            localStorage.setItem('inventoryDatabase', JSON.stringify(database));
        }

        function loadDatabase() {
            const database = JSON.parse(localStorage.getItem('inventoryDatabase')) || [];
            const inventoryList = document.getElementById('inventoryList');
            
            database.forEach(entry => {
                const listItem = document.createElement('li');
                listItem.textContent = `Part Name: ${entry.partName}, Part Number: ${entry.partNumber}, Quantity: ${entry.quantity}`;
                inventoryList.appendChild(listItem);
            });
        }

        document.addEventListener('DOMContentLoaded', loadDatabase);
    </script>
</body>
</html>
