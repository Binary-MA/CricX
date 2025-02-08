<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Stream live sports matches effortlessly on any device. Join our WhatsApp group for the latest updates.">
    <meta name="keywords" content="sports streaming, live matches, watch football, WhatsApp sports updates">
    <title>Sports Streaming</title>
    <style>
        .instruction-box, #playerContainer {
            width: 100%;
            max-width: 100%;
            margin: 15px auto;
        }

        .instruction-box {
            font-size: 14px;
            color: #333;
            background-color: #fffae5;
            border: 2px solid #ffce00;
            padding: 8px;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
        }

        #playerContainer {
            position: relative;
            background-color: black;
            width: 100%;
            max-width: 100%;
            height: 250px;
        }

        #videoPlayer, #playerIframe {
            width: 100%;
            height: 100%;
            display: block;
        }

        .whatsapp-button {
            display: inline-block;
            background-color: #25D366;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            text-decoration: none;
            text-align: center;
            margin: 15px auto;
            width: 100%;
            max-width: 720px;
            box-sizing: border-box;
            transition: background-color 0.3s ease;
        }

        .whatsapp-button:hover {
            background-color: #128C7E;
        }

        #playlist {
            display: flex;
            gap: 10px;
            margin-top: 10px;
            justify-content: center;
            flex-wrap: wrap;
            padding: 0 10px;
        }

        button {
            width: 100%;
            max-width: 350px;
            padding: 8px 12px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
            border: 1px solid #333;
            background-color: #f0f0f0;
            color: #333;
            height: auto;
            box-sizing: border-box;
        }

        @media (max-width: 768px) {
            .instruction-box {
                font-size: 13px;
                padding: 6px;
            }

            button {
                font-size: 12px;
                padding: 6px 8px;
            }

            .whatsapp-button {
                font-size: 13px;
            }

            #playerContainer {
                height: 200px;
            }
        }
    </style>
</head>
<body>

<div class="instruction-box">
    Instructions: Select a match from the buttons below to start streaming. If the video doesn’t load immediately, please wait a few seconds and try again.
</div>

<div id="loadingMessage" style="display: none;">Loading stream...</div>

<div id="playerContainer">
    <iframe id="playerIframe" src="" style="display: none;" sandbox="allow-scripts allow-same-origin"></iframe>
    <video id="videoPlayer" controls autoplay style="display: none;"></video>
</div>

<div id="playlist"></div>

<a href="https://whatsapp.com/channel/0029Vb32mMt23n3ZBynqbY2l" class="whatsapp-button" alt="Join our WhatsApp group">Join WhatsApp Group</a>

<script type="text/javascript">
const options = {
    player_list: [
        { 
            "file": "https://saseries.akamaized.net/hls/live/2110097/tappak/hdntl=exp=1739090089~acl=%2f*~data=hdntl~hmac=1d7f55d8c8bb45d561f1ef673229e7c0048baba684e9c8a30a41b857361eca27/level_4.m3u8?hdnts=exp=1739004546~acl=/hls/*~hmac=fb83303b26d3574ea685899b1027f35c4e3831bd48d3bc87987bbbc19174b810",
            "title": "Pakistan v New Zealand",
            "type": "m3u8"
        }
    ]
};

function loadVideo(videoFile, type) {
    document.getElementById("loadingMessage").style.display = "block";
    
    if (type === "m3u8") {
        document.getElementById("videoPlayer").oncanplay = function() {
            document.getElementById("loadingMessage").style.display = "none";
        };
        document.getElementById("videoPlayer").style.display = "block";
        document.getElementById("playerIframe").style.display = "none";
        document.getElementById("videoPlayer").src = videoFile;
        document.getElementById("videoPlayer").play();
    } else if (type === "php") {
        document.getElementById("playerIframe").onload = function() {
            document.getElementById("loadingMessage").style.display = "none";
        };
        document.getElementById("playerIframe").style.display = "block";
        document.getElementById("videoPlayer").style.display = "none";
        document.getElementById("playerIframe").src = videoFile;
    }

    document.getElementById("videoPlayer").onerror = function() {
        alert("Failed to load the video. Please try another link.");
        document.getElementById("loadingMessage").style.display = "none";
    };
}

const playlistContainer = document.getElementById("playlist");
options.player_list.forEach((video) => {
    const button = document.createElement("button");
    button.textContent = video.title;
    button.onclick = () => {
        loadVideo(video.file, video.type);
    };
    playlistContainer.appendChild(button);
});

window.onload = () => {
    const firstVideo = options.player_list[0];
    loadVideo(firstVideo.file, firstVideo.type);
};
</script>

</body>
</html>
