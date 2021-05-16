window.HttpService = {
  createPizza: (type) => {
    const errorMessage = 'No pizza type specified';
    if (!type) return new Promise((resolve, reject) => {
      alert(errorMessage);
      reject(errorMessage);
    });

    return fetch('/pizzas', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ type })
    });
  }
};