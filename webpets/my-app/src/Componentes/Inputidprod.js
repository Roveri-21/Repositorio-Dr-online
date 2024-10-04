import React, { useState, useEffect } from 'react';
import './Popup.css'; // Estilo do popup

function InputidprodMask() {
  const [IdProduto, setIdProduto] = useState('');
  const [error, setError] = useState('');
  const [showPopup, setShowPopup] = useState(false);

  const handleChange = (e) => {
    const value = e.target.value;
    setIdProduto(value);

    // const regex = /^[A-Za-zÀ-ÖØ-öø-ÿ\s]+$/;
    // if (!regex.test(value)) {
    //   setError('Digite apenas letras');
    //   setShowPopup(true);
    // } else {
    //   setError('');
    //   setShowPopup(false);
    // }
  };

  const handleBlur = () => {
    if (!IdProduto) {
      setError('Campo id produto e obrigatório');
      setShowPopup(true);
    } else {
      setShowPopup(false);
    }
  };

  useEffect(() => {
    if (showPopup) {
      const timer = setTimeout(() => setShowPopup(false), 4000); // Oculta o pop-up após 4 segundos
      return () => clearTimeout(timer);
    }
  }, [showPopup]);

  return (
    <div>
      <input
        type="text"
        id="IdProduto"
        name="IdProduto"
        placeholder="Id Produto"
        value={IdProduto}
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

export default InputidprodMask;
