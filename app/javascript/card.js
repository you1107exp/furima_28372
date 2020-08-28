// window.addEventListener("DOMContentLoaded", () => {
//   Payjp.setPublicKey("pk_test_xxxxxxxxxx"); // PAY.JPテスト公開鍵
//   const form = document.getElementById("charge-form");

//   form.addEventListener("submit", (e) => {
//     e.preventDefault();
//     const formResult = document.getElementById("charge-form");
//     const formData = new FormData(formResult);
//     const card = {
//       number: formData.get("number"),
//       cvc: formData.get("cvc"),
//       exp_month: formData.get("exp_month"),
//       exp_year: `20${formData.get("exp_year")}`,
//     };

//     Payjp.createToken(card, (status, response) => {
//       console.log(status)
//       console.log(response)
//       if (status === 200) {
//         const token = response.id;
//         const renderDom = document.getElementById("charge-form");
//         const tokenObj = `<input value=${token} type="hidden" name='token'>`;
//         renderDom.insertAdjacentHTML("beforeend", tokenObj);

//         document.getElementById("number").removeAttribute("name");
//         document.getElementById("cvc").removeAttribute("name");
//         document.getElementById("exp_month").removeAttribute("name");
//         document.getElementById("exp_year").removeAttribute("name");
//         document.getElementById("charge-form").submit();
//         document.getElementById("charge-form").reset();
//       } else {
//       }
//     });
//   });
// });

// window.addEventListener("load", pay);

window.addEventListener("DOMContentLoaded", () => {
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const form = document.getElementById("charge-form");

    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const sendWithoutCardInfo = () => {
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      }
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);
      const card = {
        number: formData.get("purchase_address[number]"),
        cvc: formData.get("purchase_address[cvc]"),
        exp_month: formData.get("purchase_address[exp_month]"),
        exp_year: `20${formData.get("purchase_address[exp_year]")}`,
      };

      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          // response.idでtokenが取得できます。
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          // サーバーにトークン情報を送信するために、inputタグをhidden状態で追加します。
          const tokenObj = `<input value=${token} type="hidden" name='token'>`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
          sendWithoutCardInfo()
        } else {
          // window.alert('購入処理に失敗しました。\nお手数ですが最初からやり直してください。');
          sendWithoutCardInfo()
        }
      });
    });
});