document.addEventListener("DOMContentLoaded", function () {
  const btn = document.getElementById("actionBtn");
  const msg = document.getElementById("message");

  btn.addEventListener("click", function () {
    msg.textContent = "✅ Button clicked! JavaScript is working fine.";
  });
});
