// open search model
    const searchBtn = document.querySelector('.searchButton')
    const modelContainer = document.querySelector('.model')
    const closeSearchModelBtn = document.querySelector('.cross')
    const searchInput = document.querySelector('.searchBarr')

    searchBtn.addEventListener('click', () => {
        modelContainer.classList.remove('hidden')
    })
    closeSearchModelBtn.addEventListener('click', (e) => {
    	e.preventDefault();
    	searchInput.value=""
        modelContainer.classList.add('hidden')
    })