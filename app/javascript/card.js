const pay = () => {
  Payjp.setPublicKey("pk_test_9508c4e1180fc0ea892949c5");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // カード情報を変数cardに格納
    const card = {
      number: formData.get("purchase_order[card-number]"),
      cvc: formData.get("purchase_order[card-cvc]"),
      exp_month: formData.get("purchase_order[card-exp-month]"),
      exp_year: `20${formData.get("purchase_order[card-exp-year]")}`,
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200){
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type = "hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        debugger;
      }
    });
  });
};

window.addEventListener("load", pay);