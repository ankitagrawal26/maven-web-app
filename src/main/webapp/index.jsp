<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Selection Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .form-container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container h2 {
            text-align: center;
        }
        .form-container label {
            display: block;
            margin-bottom: 10px;
        }
        .form-container input, .form-container select {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #45a049;
        }
        .result-container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Select a Book</h2>
    <form id="bookForm">
        <label for="book">Choose a book:</label>
        <select id="book" name="book">
            <option value="Book 1">Book 1</option>
            <option value="Book 2">Book 2</option>
            <option value="Book 3">Book 3</option>
            <option value="Book 4">Book 4</option>
            <option value="Book 5">Book 5</option>
        </select>

        <label for="data">Enter some data:</label>
        <input type="text" id="data" name="data" required>

        <button type="button" onclick="saveData()">Save</button>
    </form>
</div>

<div class="result-container" id="resultContainer" style="display: none;">
    <h2>Saved Data</h2>
    <p id="result"></p>
</div>

<script>
    function saveData() {
        const book = document.getElementById('book').value;
        const data = document.getElementById('data').value;

        const resultContainer = document.getElementById('resultContainer');
        const result = document.getElementById('result');

        result.innerHTML = `Book: ${book}<br>Data: ${data}`;
        resultContainer.style.display = 'block';
    }
</script>

</body>
</html>
