const create = document.getElementById("add");
const firstlist = document.getElementById("create");

create.addEventListener("click", () => {
	const inputDiv = document.createElement("div");
	const input = document.createElement("input");
	const deleteBtn = document.createElement("button");
	const updateBtn = document.createElement("button");

	deleteBtn.classList.add("delete");
	deleteBtn.innerText = "X";
	updateBtn.classList.add("update");
	updateBtn.innerText = "✔";

	firstlist.appendChild(inputDiv);
	inputDiv.setAttribute("id", Date.now());
	inputDiv.setAttribute("draggable", "true");
	inputDiv.setAttribute("class", "drag");
	inputDiv.appendChild(input);
	inputDiv.appendChild(deleteBtn);
	inputDiv.appendChild(updateBtn);

	deleteBtn.addEventListener("click", (event) => {
		inputDiv.remove();
		const id = event.target.parentNode.id;
		$.ajax({
			url: "./DeleteProj?id="+id,
			success: function(data) {
				console.log("success");
			},
			error: function(xhr, status) {
				console.log("Failed");
			},
			complete: function(xhr, status) {
				console.log("Complete");
			}
		});
	});

	updateBtn.addEventListener("click", (event) => {
		const id = event.target.parentNode.id;
		const status = event.target.parentNode.parentNode.id;
		const content = event.target.parentNode.children[0].value;
		$.ajax({
			url: "./AddUpdateProj?id="+id+"&status="+status+"&content="+content,
			success: function(data) {
				console.log("success");
			},
			error: function(xhr, status) {
				console.log("Failed");
			},
			complete: function(xhr, status) {
				console.log("Complete");
			}
		});
	});
});

let dragged;

/* 드래그 가능한 대상에서 발생하는 이벤트 */
document.addEventListener("drag", (event) => {
	console.log("dragging");
});

document.addEventListener("dragstart", (event) => {
	// 드래그한 요소에 대한 참조 저장
	dragged = event.target;
	// 반투명하게 만들기
	event.target.classList.add("dragging");
});

document.addEventListener("dragend", (event) => {
	// 투명도 초기화
	event.target.classList.remove("dragging");
});

/* 드롭 대상에서 발생하는 이벤트 */
document.addEventListener(
	"dragover",
	(event) => {
		// 드롭을 허용하기 위해 기본 동작 취소
		event.preventDefault();
	},
	false
);

document.addEventListener("dragenter", (event) => {
	// 드래그 가능한 요소가 대상 위로 오면 강조
	if (event.target.classList.contains("dropzone")) {
		event.target.classList.add("dragover");
	}
});

document.addEventListener("dragleave", (event) => {
	// 드래그 가능한 요소가 대상 밖으로 나가면 강조 제거
	if (event.target.classList.contains("dropzone")) {
		event.target.classList.remove("dragover");
	}
});

document.addEventListener("drop", (event) => {
	// 일부 요소의 링크 열기와 같은 기본 동작 취소
	event.preventDefault();
	// 드래그한 요소를 선택한 드롭 대상으로 이동
	if (event.target.classList.contains("dropzone")) {
		event.target.classList.remove("dragover");
		dragged.parentNode.removeChild(dragged);
		event.target.appendChild(dragged);
	}
});