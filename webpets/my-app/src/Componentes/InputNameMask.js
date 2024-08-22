import React, { useState, useEffect } from 'react';
import './Popup.css'; // Estilo do popup

function InputNameMask() {
  const [nomeVendedor, setNomeVendedor] = useState('');
  const [error, setError] = useState('');
  const [showPopup, setShowPopup] = useState(false);

  const handleChange = (e) => {
    const value = e.target.value;
    setNomeVendedor(value);

    const regex = /^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$/;
    if (!regex.test(value)) {
      setError('Digite apenas letras');
      setShowPopup(true);
    } else {
      setError('');
      setShowPopup(false);
    }
  };

  const handleBlur = () => {
    if (!nomeVendedor) {
      setError('Campo obrigatório');
      setShowPopup(true);
    } else {
      setShowPopup(false);
    }
  };

  useEffect(() => {
    if (showPopup) {
      const timer = setTimeout(() => setShowPopup(false), 3000); // Oculta o pop-up após 3 segundos
      return () => clearTimeout(timer);
    }
  }, [showPopup]);

  return (
    <div>
      <input
        type="text"
        id="nomeVendedor"
        name="nomeVendedor"
        placeholder="Nome Vendedor"
        value={nomeVendedor}
        onChange={handleChange}
        onBlur={handleBlur}
      />
      {showPopup && (
        <div className={`popup ${showPopup ? 'show' : ''}`}>
          {error}
        </div>
      )}
    </div>
  );
}

export default InputNameMask;
