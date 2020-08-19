window.addEventListener('load', function(){
  const priceForm = document.getElementById("item-price");
  const commission = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceForm.addEventListener('input', function(){
    // 価格に入力した数値の取得
    const priceValue = priceForm.value;
    const price = Number(priceValue);

    // 販売手数料の取得
    const commissionFeeValue = Math.round(price * 0.1);
    commission.textContent = commissionFeeValue;

    // 販売利益の取得
    const profitValue = (price - commissionFeeValue);
    profit.textContent = profitValue;
  })
})