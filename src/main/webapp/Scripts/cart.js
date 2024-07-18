

    const addButton = document.querySelectorAll('.plus-btn')
    const minusButton = document.querySelectorAll('.minus-btn')
const maxQuantity = 10;
    


    addButton.forEach(addBtn => {
        addBtn.addEventListener('click', (e) => {
            e.preventDefault()
            const inputElement = addBtn.previousElementSibling;
            
           
            //checking if value is greater than total stock or not
            if (inputElement.value < maxQuantity) {
                const updateQtyBtn = addBtn.parentElement.parentElement.querySelector('.updateQCart')
                if (updateQtyBtn.classList.contains('hidden')) {
                    updateQtyBtn.classList.remove('hidden')
                }
                // updates the value if value is not  more than stock
                inputElement.value = +inputElement.value + 1;
            }
        })
    })
    minusButton.forEach(minusBtn => {
        minusBtn.addEventListener('click', (e) => {
            e.preventDefault()
            const inputElement = minusBtn.nextElementSibling;
            console.log(inputElement);
            if (inputElement.value > 1) {
                const updateQtyBtn = minusBtn.parentElement.parentElement.querySelector('.updateQCart')
                if (updateQtyBtn.classList.contains('hidden')) {
                    updateQtyBtn.classList.remove('hidden')
                }
                inputElement.value = +inputElement.value - 1;
            }

        })
    })


    // opening and closing cart
    const cartOpenBtn = document.querySelector('.cart')
    const cartSection = document.querySelector('.cartModel')
    const cartCloseBtn = document.querySelector('.closeCart')

    cartOpenBtn.addEventListener('click', () => {
        cartSection.classList.remove('hidden')
    })
    cartCloseBtn.addEventListener('click', () => {
        cartSection.classList.add('hidden')
    })