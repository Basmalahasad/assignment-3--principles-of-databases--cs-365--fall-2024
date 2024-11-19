<?php

require_once "includes/config.php";
require_once "includes/helpers.php";

if (isset($_POST['attribute']) && isset($_POST['search'])) {
    $attribute = htmlspecialchars($_POST['attribute']);
    $search = htmlspecialchars($_POST['search']);

    search($attribute, $search);
}

if (isset($_POST['update_attribute'], $_POST['new_value'], $_POST['query_attribute'], $_POST['pattern'])) {
    $update_attribute = htmlspecialchars($_POST['update_attribute']);
    $new_value = htmlspecialchars($_POST['new_value']);
    $query_attribute = htmlspecialchars($_POST['query_attribute']);
    $pattern = htmlspecialchars($_POST['pattern']);

    update($update_attribute, $new_value, $query_attribute, $pattern);
}

if (isset($_POST['website_name'], $_POST['website_url'], $_POST['email'], $_POST['username'], $_POST['passphrase'], $_POST['comment'])) {
    $website_name = htmlspecialchars($_POST['website_name']);
    $website_url = htmlspecialchars($_POST['website_url']);
    $email = htmlspecialchars($_POST['email']);
    $username = htmlspecialchars($_POST['username']);
    $passphrase = htmlspecialchars($_POST['passphrase']);
    $comment = htmlspecialchars($_POST['comment']);

    insert($website_name, $website_url, $email, $username, $passphrase, $comment);
}

if (isset($_POST['delete_attribute'], $_POST['delete_pattern'])) {
    $delete_attribute = htmlspecialchars($_POST['delete_attribute']);
    $delete_pattern = htmlspecialchars($_POST['delete_pattern']);

    delete($delete_attribute, $delete_pattern);
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passwords Database</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    <div class="header-container">
      <h1>Passwords Database</h1>
      <form method="post" action="index.php">
        <input type="hidden" name="clear_results" value="1">
        <button type="submit" class="clear-results-button">Clear Results</button>
      </form>
    </div>

    <!-- Search Form -->
    <h2>Search Database</h2>
    <form method="post" action="index.php">
      <label for="attribute">Search in:</label>
      <select name="attribute" id="attribute" required>
        <option value="all">All Fields</option>
        <option value="user_id">User ID</option>
        <option value="first_name">First Name</option>
        <option value="last_name">Last Name</option>
        <option value="email">Email</option>
        <option value="website_id">Website ID</option>
        <option value="website_name">Website Name</option>
        <option value="url">Website URL</option>
        <option value="username">Username</option>
        <option value="passphrase">Passphrase</option>
        <option value="created_at">Date Created</option>
        <option value="comments">Comments</option>
      </select>
      <label for="search">For:</label>
      <input type="text" id="search" name="search" required>
      <button type="submit">Search</button>
    </form>

    <!-- Update Form -->
    <h2>Update an Attribute</h2>
    <form method="post" action="index.php">
      <label for="update_attribute">Update:</label>
      <select name="update_attribute" id="update_attribute" required>
        <option value="first_name">First Name</option>
        <option value="last_name">Last Name</option>
        <option value="email">Email</option>
        <option value="website_name">Website Name</option>
        <option value="url">Website URL</option>
        <option value="username">Username</option>
        <option value="passphrase">Passphrase</option>
        <option value="comments">Comments</option>
      </select>
      <label for="new_value">To:</label>
      <input type="text" id="new_value" name="new_value" required>
      <label for="query_attribute">Where:</label>
      <select name="query_attribute" id="query_attribute" required>
        <option value="user_id">User ID</option>
        <option value="first_name">First Name</option>
        <option value="last_name">Last Name</option>
        <option value="email">Email</option>
        <option value="website_id">Website ID</option>
        <option value="website_name">Website Name</option>
        <option value="url">Website URL</option>
        <option value="username">Username</option>
        <option value="passphrase">Passphrase</option>
        <option value="created_at">Date Created</option>
        <option value="comments">Comments</option>
      </select>
      <label for="pattern">Is:</label>
      <input type="text" id="pattern" name="pattern" required>
      <button type="submit">Update</button>
    </form>

    <!-- Insert Form -->
    <h2>Insert New Entry</h2>
    <form method="post" action="index.php">
      <label for="website_name">Website Name:</label>
      <input type="text" id="website_name" name="website_name" required>
      <label for="website_url">Website URL:</label>
      <input type="text" id="website_url" name="website_url" required>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required>
      <label for="passphrase">Passphrase:</label>
      <input type="password" id="passphrase" name="passphrase" required>
      <label for="comment">Comment:</label>
      <textarea id="comment" name="comment"></textarea>
      <button type="submit">Insert</button>
    </form>

    <!-- Delete Form -->
    <h2>Delete an Entry</h2>
    <form method="post" action="index.php">
      <label for="delete_attribute">Delete:</label>
      <select name="delete_attribute" id="delete_attribute" required>
        <option value="user_id">User ID</option>
        <option value="first_name">First Name</option>
        <option value="last_name">Last Name</option>
        <option value="email">Email</option>
        <option value="website_id">Website ID</option>
        <option value="website_name">Website Name</option>
        <option value="url">Website URL</option>
        <option value="username">Username</option>
        <option value="passphrase">Passphrase</option>
        <option value="created_at">created_at</option>
        <option value="comments">Comments</option>
      </select>
      <label for="delete_pattern">Where:</label>
      <input type="text" id="delete_pattern" name="delete_pattern" required>
      <button type="submit">Delete</button>
    </form>
  </body>
</html>
