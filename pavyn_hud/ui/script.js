let money     = [0,0,0];
let i         = 0;
let hudHidden = false
let kmh       = true

$(document).ready(function () {
    window.addEventListener('message', function (event) {
        let data = event.data
        if (data.money != null) {
            money = data.money
            document.querySelectorAll(".accounts p").forEach((element) => {
                element.innerHTML = money[i];
                element.innerHTML = element.innerHTML.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
                element.innerHTML = "$" + element.innerHTML,
                i++;
            })
            
            let width_ = 5 + Math.max(...money).toString().length / 3.5 + "vw";
            $(".accounts p").css("width", width_);
            i = 0;
        } else {

            if (data.speed != null) {
                if (data.kmh) {
                    $('.speedometer h1').html(data.speed + '<span class="kmh"> km/h</span>');
                } else {
                    $('.speedometer h1').html(data.speed + '<span class="kmh"> mph</span>');
                }
                $('.speedometer h1').fadeIn("slow");
            } else {
                $('.speedometer h1').fadeOut("slow");
            }

            $('.id').text(data.id);
            $('.players').text(data.players);
            $('.health p').text(data.health + " hp");
            $('.armor p').text(data.armor + " hp");

        }

        if (data.joined) {
            $('#server-name').html(data.servername);
        }

        if (data.hide) {
            if (hudHidden) {
                $('body').css("display", "block");
            } else {
                $('body').css("display", "none");
            }
            hudHidden = !hudHidden;
        }
    });
});