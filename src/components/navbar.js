import React from "react"
export default function Navbar({children}) {
    return (
        <nav class="sm:h-20 flex sm:flex items-center sm:justify-between w-full sm:flex-row flex-col border-b-2 border-gray-400 bg-white">
        <div class="flex items-center ml-4 bg-gray-100 rounded-lg w-80 h-10 p-5 sm:mt-0 mt-3">
            <i class="fa-solid fa-magnifying-glass opacity-50 text-lg"></i>
            <input class="bg-gray-100 outline-0 text-lg pl-2.5" type="text" placeholder="Search..." />
        </div>
        <ul class="px-2 py-4 flex space-x-4">
            <li><i class="fa-solid fa-question bg-gray-500 rounded-full py-1 px-2 mt-2 text-white"></i></li>
            <li><i class="fa-solid fa-bell mx-2 mt-1 text-2xl text-gray-500"></i></li>
            <li><img src="https://media.istockphoto.com/id/1399611777/photo/portrait-of-a-smiling-little-brown-haired-boy-looking-at-the-camera-happy-kid-with-good.jpg?s=2048x2048&w=is&k=20&c=nyOxOKJQvvUOXIZ1s7mPF4zUySY1eKBIl88Vbwi7wLA="
                class="h-10 rounded-full" /></li>
            <p class="text-sm"> <span class="font-bold">Saad Sohail</span> <br /> Web Developer</p>
        </ul>
    </nav>
    )
}