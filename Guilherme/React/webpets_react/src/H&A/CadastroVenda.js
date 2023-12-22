import React, { useState, useRef } from 'react';
import './FileUploadSquare.css'; // Arquivo de estilos CSS para o componente
import { FaArrowDown } from 'react-icons/fa'; // Importar ícone de seta para baixo

function App() {
  const [dragging, setDragging] = useState(false);
  const [selectedFileName, setSelectedFileName] = useState('');
  const fileInputRef = useRef(null);

  const handleDragEnter = (e) => {
    e.preventDefault();
    setDragging(true);
  };

  const handleDragLeave = () => {
    setDragging(false);
  };

  const handleDragOver = (e) => {
    e.preventDefault();
  };

  const handleDrop = (e) => {
    e.preventDefault();
    setDragging(false);
    const files = e.dataTransfer.files;
    // Faça algo com os arquivos soltos, como enviar para o servidor, etc.
    console.log('Arquivos soltos:', files);
  };

  const handleButtonClick = () => {
    fileInputRef.current.click();
  };

  const handleFileChange = (event) => {
    const file = event.target.files[0];
    setSelectedFileName(file.name); // Armazenar o nome do arquivo
    // Faça o que for necessário com o arquivo selecionado
    console.log('Arquivo selecionado:', file);
  };

  return (
    <div className="drop-area"
      onDragEnter={handleDragEnter}
      onDragLeave={handleDragLeave}
      onDragOver={handleDragOver}
      onDrop={handleDrop}
    >
      {dragging && (
        <div className="drag-overlay">
          <FaArrowDown />
          Solte o arquivo aqui
        </div>
      )}
      {selectedFileName && <p>Arquivo selecionado: {selectedFileName}</p>}
      Solte o arquivo aqui ou 
      <input
        type="file"
        ref={fileInputRef}
        style={{ display: 'none' }}
        onChange={handleFileChange}
      />
      <button onClick={handleButtonClick}>Selecionar Arquivo</button>
    </div>
  );
}

export default App;
