/**
 * 
 */    // format number with commas

    const priceEle = document.querySelectorAll('.priceNum');
    priceEle.forEach(price => {
        const stringPrice = price.innerText;
        const prices = parseFloat(stringPrice);
       
        let formattedNumber = prices.toLocaleString('en-IN');
        price.innerText = formattedNumber;
    })