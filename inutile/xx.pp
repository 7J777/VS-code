program DataGenerator;

uses
  SysUtils, Classes, fpjson, jsonparser;

type
  TDataItem = record
    id: Integer;
    value: Integer;
  end;

var
  Data: array[0..9] of TDataItem;
  JSONData: TJSONArray;
  i: Integer;
  JSONString: TStringList;

begin
  Randomize;
  JSONData := TJSONArray.Create;
  try
    for i := 0 to 9 do
    begin
      Data[i].id := i;
      Data[i].value := Random(100);
      JSONData.AddElement(TJSONObject.Create(['id', Data[i].id, 'value', Data[i].value]));
    end;

    JSONString := TStringList.Create;
    try
      JSONString.Text := JSONData.FormatJSON();
      JSONString.SaveToFile('data.json');
    finally
      JSONString.Free;
    end;
  finally
    JSONData.Free;
  end;
end.