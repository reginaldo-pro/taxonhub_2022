import { Button, Input } from "@chakra-ui/react";
import { ChangeEvent, useRef, useState } from "react";
import { FiUpload } from "react-icons/fi";
import { toast } from "react-toastify";
import React from "react";
import { CustomButton } from "../CustomButton";
interface HTMLInputEvent extends ChangeEvent {
  target: HTMLInputElement & EventTarget;
}

/**
 *
 * @return {toast}
 */
export function SendCSV() {
  const fileRef = useRef() as React.MutableRefObject<HTMLInputElement>;
  const [fileName, setFileName] = useState<string | undefined>("Enviar CSV");

  const handleChange = (e: HTMLInputEvent) => {
    if (!e.target.files?.length) {
      return;
    }

    const files = e.target.files?.[0];

    if (files?.name.split(".").pop() !== "csv") {
      return toast.error("Formato errado.");
    }

    if (files?.size > 10000000) {
      return toast.error("Tamanho máximo excedido (10MB).");
    }

    setFileName(files?.name);
    return toast.success("Arquivo adicionado.");
  };

  return (
    <>
      <CustomButton icon={FiUpload} onClick={() => fileRef.current.click()}>
        {fileName}
      </CustomButton>
      <Input
        ref={fileRef}
        onChange={handleChange}
        multiple={false}
        type="file"
        accept=".csv"
        sx={{ border: "none", display: "none" }}
      />
    </>
  );
}
