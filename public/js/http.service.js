const defaultHttpParams = {
  headers: {
    'Content-Type': 'application/json',
  },  
}

window.HttpService = {
  createPizza: (type) => {
    const errorMessage = 'No pizza type specified';
    if (!type) return new Promise((resolve, reject) => {
      alert(errorMessage);
      reject(errorMessage);
    });

    return fetch('/pizzas', {
      method: 'POST',
      body: JSON.stringify({ type }),
      ...defaultHttpParams,
    });
  },

  findPizzasByType: (type) => {
    let query = '';
    if (type) query = `?type=${type}`;

    return fetch(`/pizzas${query}`, {
      method: 'GET',
      ...defaultHttpParams,
    });
  },

  deletePizza: (id) => {
    const errorMessage = 'No pizza id specified';
    if (!id) return new Promise((resolve, reject) => {
      alert(errorMessage);
      reject(errorMessage);
    });

    return fetch(`/pizzas/${id}`, {
      method: 'DELETE',
      ...defaultHttpParams,
    });
  },

  findPeopleByName: (name) => {
    let query = '';
    if (name) query = `?name=${name}`;

    return fetch(`/people${query}`, {
      method: 'GET',
      ...defaultHttpParams,
    });
  }
};