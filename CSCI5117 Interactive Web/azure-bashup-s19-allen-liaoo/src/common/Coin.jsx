import { useState } from "react";

export default function Coin() {
    let [coin, setCoin] = useState(true)
    let [coinDisplay, setCoinDisplay] = useState(coin+"")
    async function flipCoin() {
        setCoinDisplay("flipping...")
        const result = await fetch("/api/flipCoin/"+coin, {
            method: "get"
        });
        const res = await result.json()
        console.log(res)
        setCoin(res.coinState)
        setCoinDisplay(res.coinState+"")
    }

    return <div onClick={flipCoin}>
        { coinDisplay }
    </div>
}