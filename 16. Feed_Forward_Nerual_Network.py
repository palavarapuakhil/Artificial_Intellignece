import tensorflow as tf
import numpy as np

# Sample data (XOR problem)
X = np.array([[0, 0], [0, 1], [1, 0], [1, 1]], dtype=np.float32)
y = np.array([[0], [1], [1], [0]], dtype=np.float32)

# Define the neural network architecture
model = tf.keras.Sequential([
    tf.keras.layers.Dense(2, activation='relu', input_dim=2),  # Input layer with 2 neurons
    tf.keras.layers.Dense(1, activation='sigmoid')  # Output layer with 1 neuron (binary classification)
])

# Compile the model
model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# Train the model
model.fit(X, y, epochs=10000, verbose=0)

# Evaluate the model
loss, accuracy = model.evaluate(X, y)
print(f"Loss: {loss}, Accuracy: {accuracy}")

# Make predictions
predictions = model.predict(X)
print("Predictions:")
for i in range(len(X)):
    print(f"Input: {X[i]}, Predicted Output: {predictions[i]}")
