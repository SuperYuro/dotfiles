{ ... }:

{
  services = {
    postgresql = {
      enable = true;
      extensions =
        ps: with ps; [
          pgvector
        ];
    };
    qdrant = {
      enable = true;
    };
  };
}
