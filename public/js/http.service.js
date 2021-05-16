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
  },

  findPizzasByType: (type) => {
    let query = '';
    if (type) query = `?type=${type}`;

    return fetch(`/pizzas${query}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
    });
  },
};