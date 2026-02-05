const fs = require('fs');
const path = require('path');

const infoPath = path.join(__dirname, '../business-info.json');
const info = JSON.parse(fs.readFileSync(infoPath, 'utf8'));

// Google Maps Review Link (Review Intent)
const reviewUrl = `https://search.google.com/local/writereview?placeid=ChIJo-VqA6-M0msRrWp8y9lP2_8`;

const flyerHtml = `
<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: 'Arial', sans-serif; text-align: center; padding: 50px; color: #333; }
        .card { border: 10px solid #6a11cb; padding: 40px; border-radius: 20px; max-width: 600px; margin: 0 auto; }
        h1 { color: #6a11cb; font-size: 3rem; margin-bottom: 10px; }
        h2 { font-size: 1.5rem; margin-top: 0; color: #666; }
        .qr-placeholder { background: #eee; width: 300px; height: 300px; margin: 30px auto; border: 2px dashed #999; display: flex; align-items: center; justify-content: center; font-weight: bold; }
        .footer { margin-top: 40px; font-size: 1.2rem; }
        .phone { color: #6a11cb; font-weight: bold; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Review Us!</h1>
        <h2>Help ${info.name} grow in Bairnsdale</h2>
        
        <div class="qr-placeholder">
            [ SCAN QR CODE TO REVIEW ]<br>
            <span style="font-size: 0.8rem; font-weight: normal; margin-top: 10px;">(QR matches: ${reviewUrl})</span>
        </div>

        <p>Your feedback helps other local residents find reliable tech support.</p>
        
        <div class="footer">
            Need more help? Call <span class="phone">${info.phone}</span>
        </div>
    </div>
</body>
</html>
`;

const outputPath = path.join(__dirname, '../REVIEW-FLYER.html');
fs.writeFileSync(outputPath, flyerHtml);
console.log(`✅ Review Flyer generated at: ${outputPath}`);
console.log(`👉 Open this file in your browser and print it to give to clients!`);
