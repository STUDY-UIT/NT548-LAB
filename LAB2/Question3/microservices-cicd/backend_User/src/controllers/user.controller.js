const User = require('../models/user.model');

// Hello cac ban

exports.getAllUsers = async (req, res) => {
  const users = await User.getAll();
  res.json(users);
};
/////Ư
exports.getUserById = async (req, res) => {
  const { id } = req.params;
  
  // Validate ID is a positive integer
  if (!Number.isInteger(Number(id)) || Number(id) <= 0) {
    return res.status(400).json({ error: 'Invalid user ID' });
  }
  
  const user = await User.getById(id);
  res.json(user);
};

exports.createUser = async (req, res) => {
  const { name, email, password } = req.body;
  const newUser = await User.create(name, email, password);
  res.status(201).json(newUser);
};

exports.loginUser = async (req, res) => {
  const { email, password } = req.body;
  const user = await User.checkLogin(email, password);
  res.json(user);
};

exports.deleteUser = async (req, res) => {
  const { id } = req.params;
  
  if (!Number.isInteger(Number(id)) || Number(id) <= 0) {
    return res.status(400).json({ error: 'Invalid user ID' });
  }
  
  await User.delete(id);
  res.json({ message: 'User deleted' });
};